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

  test('code!=200 throws NetException and passes code/message through (pins current behavior)', () {
    final r = resp({'code': 400, 'errorMsg': '出错了'});
    expect(
      () => decoder.decode<_FakeModel, _FakeModel>(
          response: r, decodeType: _FakeModel()),
      throwsA(isA<NetException>()
          .having((e) => e.code, 'code', 400)
          .having((e) => e.message, 'message', '出错了')),
    );
  });

  // Characterization test for a cross-stack contract drift (x-contract critical item): the backend
  // ResponseResult field is `msg` (grep for `errorMsg` across Loggi_server: 0 hits), but the decoder
  // reads only `errorMsg`, so the backend error text is always lost and the user only ever sees the
  // decoder's hardcoded fallback string (the exact literal is asserted below). This is the real
  // current behavior, not something this slice fixes — the test goes red once S18 aligns the contract.
  test('a real backend error body uses msg, not errorMsg, so its text is discarded (pins a known bug)', () {
    final r = resp({'code': 403, 'status': false, 'msg': '你没有访问权限'});
    expect(
      () => decoder.decode<_FakeModel, _FakeModel>(
          response: r, decodeType: _FakeModel()),
      throwsA(isA<NetException>()
          .having((e) => e.code, 'code', 403)
          .having((e) => e.message, 'message', '请求出错')),
    );
  });
}
