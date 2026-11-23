import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:loggi_app/app/data/api/distribution_status_change.dart';
import 'package:loggi_app/app/data/network/api_client.dart';
import 'package:loggi_app/app/data/network/api_exception.dart';
import 'package:loggi_app/app/data/network/interceptors/envelope_interceptor.dart';
import 'package:loggi_app/app/data/repositories/distribution_repository.dart';

/// Advancing an order is a PATCH on that order, not a second POST.
///
/// The defect this pins lived in the request shape, which is why it is tested here rather than
/// on a widget: the stepper "approved" an order by posting it to `/distribution` again, the
/// server read a body without an id as a new order, and the list grew by one copy per approval
/// while the original stayed under review. Nothing on screen errored.
void main() {
  late DioAdapter adapter;
  late DistributionRepository repository;

  setUp(() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'http://test.local/api',
        validateStatus: (status) => status != null,
      ),
    );
    adapter = DioAdapter(dio: dio);
    dio.interceptors.add(const EnvelopeInterceptor());
    repository = DistributionRepository(ApiClient(dio));
  });

  test(
    'approving names the order in the path and sends only the target status',
    () async {
      adapter.onPatch(
        '/distribution/o1/status',
        (server) => server.reply(200, {
          'code': 200,
          'status': true,
          'data': {'id': 'o1', 'status': 'REVIEW_SUCCESS'},
        }),
        data: {'status': 'REVIEW_SUCCESS'},
      );

      final moved = await repository.changeStatus(
        'o1',
        DistributionStatusChangeStatusEnum.REVIEW_SUCCESS,
      );

      // The same order came back moved - not a new one beside it.
      expect(moved.id, 'o1');
      expect(moved.status?.value, 'REVIEW_SUCCESS');
    },
  );

  test(
    'a refused move surfaces the server code for the caller to explain',
    () async {
      adapter.onPatch(
        '/distribution/o1/status',
        (server) => server.reply(409, {
          'code': 409,
          'status': false,
          'msg': 'an order in END cannot move to REVIEW_SUCCESS',
          'errorCode': 'INVALID_STATUS_TRANSITION',
        }),
        data: {'status': 'REVIEW_SUCCESS'},
      );

      await expectLater(
        repository.changeStatus(
          'o1',
          DistributionStatusChangeStatusEnum.REVIEW_SUCCESS,
        ),
        throwsA(
          isA<ApiException>().having(
            (e) => e.errorCode,
            'errorCode',
            'INVALID_STATUS_TRANSITION',
          ),
        ),
      );
    },
  );
}
