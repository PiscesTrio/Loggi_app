// Response/RequestOptions are re-exported by flutter_nb_net; importing dio separately trips unnecessary_import.
import 'package:flutter_nb_net/flutter_net.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loggi_app/app/data/network/decoder.dart';

/// Minimal fake model, signature matching the real ones (see `@override Model fromJson(Map)` in warehouse.dart).
class _FakeModel extends BaseNetModel {
  String? name;
  _FakeModel({this.name});
  @override
  _FakeModel fromJson(Map<String, dynamic> json) => _FakeModel(name: json['name']);
}

void main() {
  final decoder = MyHttpDecoder.getInstance();

  Response<dynamic> resp(dynamic data) =>
      Response(requestOptions: RequestOptions(path: '/x'), data: data);

  test('code=200 with a single object in data unwraps into the model (pins current behavior)', () {
    final r = resp({'code': 200, 'data': {'name': 'A仓库'}});
    final model = decoder.decode<_FakeModel, _FakeModel>(
        response: r, decodeType: _FakeModel());
    expect(model.name, 'A仓库');
  });

  test('code=200 with a List in data unwraps into a List (pins current behavior)', () {
    final r = resp({'code': 200, 'data': [{'name': 'a'}, {'name': 'b'}]});
    final list = decoder.decode<_FakeModel, List<_FakeModel>>(
        response: r, decodeType: _FakeModel());
    expect(list.length, 2);
    expect(list.first.name, 'a');
  });

  // These two were written as characterization tests, and the second said in its own comment
  // that it would go red once the contract was aligned. It did — at S06 rather than S18,
  // because the decoder fix came with the backend's real status codes. Both now describe the
  // behaviour instead of the defect.
  test('code!=200 delivers the backend message from `msg`', () {
    final r = resp({'code': 400, 'status': false, 'msg': '出错了'});
    expect(
      () => decoder.decode<_FakeModel, _FakeModel>(
          response: r, decodeType: _FakeModel()),
      throwsA(isA<NetException>()
          .having((e) => e.code, 'code', 400)
          .having((e) => e.message, 'message', '出错了')),
    );
  });

  test('a real backend error body reaches the user with its own text', () {
    // The inverted version of the bug this used to pin: the decoder read
    // `response.data['errorMsg']`, a key the backend has never sent — the envelope field is
    // `msg` — so every error message the server wrote was replaced by NetException's generic
    // fallback, one key name away from the user.
    final r = resp({'code': 403, 'status': false, 'msg': '你没有访问权限'});
    expect(
      () => decoder.decode<_FakeModel, _FakeModel>(
          response: r, decodeType: _FakeModel()),
      throwsA(isA<NetException>()
          .having((e) => e.code, 'code', 403)
          .having((e) => e.message, 'message', '你没有访问权限')),
    );
  });

  test('a body without a msg field still fails, with the generic fallback', () {
    // Spring answers an unmapped path with its own error shape, which carries no `msg`.
    final r = resp({'code': 404, 'status': false});
    expect(
      () => decoder.decode<_FakeModel, _FakeModel>(
          response: r, decodeType: _FakeModel()),
      throwsA(isA<NetException>()
          .having((e) => e.code, 'code', 404)
          .having((e) => e.message, 'message', '请求出错')),
    );
  });

  test('a non-Map body is refused rather than subscripted', () {
    // Now that non-2xx responses are decoded instead of becoming DioExceptions, an HTML
    // error page or an empty body reaches this code. `body['code']` on a String throws
    // NoSuchMethodError, which flutter_nb_net's _execute does not catch — it would escape
    // past every failure handler in the app.
    final r = Response<dynamic>(
        requestOptions: RequestOptions(path: '/x'),
        statusCode: 502,
        data: '<html>502 Bad Gateway</html>');
    expect(
      () => decoder.decode<_FakeModel, _FakeModel>(
          response: r, decodeType: _FakeModel()),
      throwsA(isA<NetException>().having((e) => e.code, 'code', 502)),
    );
  });
}
