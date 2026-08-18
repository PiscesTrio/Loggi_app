import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:loggi_app/app/data/auth/token_storage.dart';
import 'package:loggi_app/app/data/network/api_client.dart';
import 'package:loggi_app/app/data/network/api_exception.dart';
import 'package:loggi_app/app/data/network/interceptors/auth_interceptor.dart';
import 'package:loggi_app/app/data/network/interceptors/envelope_interceptor.dart';

/// A [TokenStorage] whose backing store is a variable.
///
/// Subclassed rather than mocked because the two methods under test here are `read` and
/// `clear`, and what matters is the sequence of calls the interceptor makes against them.
class _MemoryTokenStorage implements TokenStorage {
  _MemoryTokenStorage([this._token]);

  String? _token;
  int clearCount = 0;

  @override
  Future<String?> read() async => _token;

  @override
  Future<void> write(String token) async => _token = token;

  @override
  Future<void> clear() async {
    _token = null;
    clearCount++;
  }

  @override
  Future<bool> isLoggedIn() async => _token != null;
}

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late _MemoryTokenStorage tokens;
  late ApiClient client;
  late List<String> unauthorizedEvents;

  /// Builds the same stack as `dioProvider`, minus the retry and log interceptors, which
  /// are not what these tests are about.
  void buildClient({String? token}) {
    tokens = _MemoryTokenStorage(token);
    unauthorizedEvents = [];
    dio = Dio(BaseOptions(
      baseUrl: 'http://test.local/api',
      validateStatus: (status) => status != null,
    ));
    adapter = DioAdapter(dio: dio);
    dio.interceptors.addAll([
      AuthInterceptor(tokens, onUnauthorized: () => unauthorizedEvents.add('cleared')),
      const EnvelopeInterceptor(),
    ]);
    client = ApiClient(dio);
  }

  setUp(() => buildClient(token: 'jwt-abc'));

  group('envelope', () {
    test('code=200 hands back data, not the envelope', () async {
      adapter.onGet('/warehouse', (server) {
        server.reply(200, {
          'code': 200,
          'status': true,
          'msg': null,
          'data': [
            {'name': 'A仓库'}
          ],
        });
      });

      final data = await client.get<List<dynamic>>('/warehouse');

      // Every call site used to unwrap this itself. Doing it once means a caller that
      // forgets is impossible rather than merely unlikely.
      expect(data, hasLength(1));
      expect((data.first as Map)['name'], 'A仓库');
    });

    test('a business error becomes an ApiException carrying the backend message', () async {
      adapter.onPost('/admin/login/password', (server) {
        server.reply(400, {'code': 400, 'status': false, 'msg': '邮箱或密码错误'});
      }, data: Matchers.any);

      // The message is the point. The decoder this replaces read `errorMsg`, a key the
      // backend has never sent, so every message the server wrote was thrown away and the
      // user saw a generic fallback instead.
      await expectLater(
        client.post<dynamic>('/admin/login/password', data: {'email': 'a@b.c'}),
        throwsA(isA<ApiException>()
            .having((e) => e.message, 'message', '邮箱或密码错误')
            .having((e) => e.statusCode, 'statusCode', 400)
            .having((e) => e.code, 'code', 400)),
      );
    });

    test('a 429 is recognisable as rate limiting rather than a generic failure', () async {
      adapter.onPost('/admin/verification-code', (server) {
        server.reply(429, {'code': 429, 'status': false, 'msg': '请求过于频繁，请稍后再试'});
      }, data: Matchers.any);

      await expectLater(
        client.post<dynamic>('/admin/verification-code'),
        throwsA(isA<ApiException>().having((e) => e.isRateLimited, 'isRateLimited', true)),
      );
    });

    test('a non-envelope error body does not throw NoSuchMethodError', () async {
      adapter.onGet('/warehouse', (server) {
        server.reply(502, '<html>502 Bad Gateway</html>');
      });

      // `body['code']` on a String is a NoSuchMethodError, and nothing in the old stack
      // caught it, so it escaped past every failure handler in the app.
      await expectLater(
        client.get<dynamic>('/warehouse'),
        throwsA(isA<ApiException>().having((e) => e.statusCode, 'statusCode', 502)),
      );
    });
  });

  group('auth', () {
    test('the Bearer header is attached without any screen asking', () async {
      String? seenHeader;
      adapter.onGet('/commodity', (server) {
        server.reply(200, {'code': 200, 'status': true, 'data': []});
      });
      dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
        seenHeader = options.headers['Authorization'] as String?;
        handler.next(options);
      }));

      await client.get<List<dynamic>>('/commodity');

      // Two screens used to set this by hand. Any entry point that forgot produced an app
      // that looked signed in and got 401s.
      expect(seenHeader, 'Bearer jwt-abc');
    });

    test('no token means no header, rather than a header saying there is none', () async {
      buildClient();
      String? seenHeader = 'sentinel';
      adapter.onGet('/commodity', (server) {
        server.reply(200, {'code': 200, 'status': true, 'data': []});
      });
      dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
        seenHeader = options.headers['Authorization'] as String?;
        handler.next(options);
      }));

      await client.get<List<dynamic>>('/commodity');

      // Logging out used to store the literal "not logged in" as the token, which then
      // went out as `Authorization: Bearer not logged in`.
      expect(seenHeader, isNull);
    });

    test('a 401 clears the token and reports it once', () async {
      adapter.onGet('/commodity', (server) {
        server.reply(401, {'code': 401, 'status': false, 'msg': 'Invalid or expired token'});
      });

      await expectLater(
        client.get<dynamic>('/commodity'),
        throwsA(isA<ApiException>().having((e) => e.isUnauthorized, 'isUnauthorized', true)),
      );

      // Keeping a token the server has already rejected means every later request fails
      // the same way, and the app has no idea why.
      expect(await tokens.read(), isNull);
      expect(tokens.clearCount, 1);
      expect(unauthorizedEvents, ['cleared']);
    });
  });

  group('transport failures', () {
    test('a connection error arrives as an ApiException in the app language', () async {
      adapter.onGet('/warehouse', (server) {
        server.throws(
          0,
          DioException.connectionError(
            requestOptions: RequestOptions(path: '/warehouse'),
            reason: 'no route to host',
          ),
        );
      });

      // Dio's own message here is English boilerplate; for a 401 it even describes the
      // status as "bad syntax". Nothing in this app should show a user that sentence.
      await expectLater(
        client.get<dynamic>('/warehouse'),
        throwsA(isA<ApiException>().having((e) => e.message, 'message', '无法连接到服务器')),
      );
    });
  });
}
