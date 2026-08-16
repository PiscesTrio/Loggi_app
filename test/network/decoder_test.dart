// Response/RequestOptions 由 flutter_nb_net 再导出，无需单独 import dio（unnecessary_import）。
import 'package:flutter_nb_net/flutter_net.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loggi_app/app/data/network/decoder.dart';

/// 最小 fake model，签名对齐真实模型（见 warehouse.dart 的 `@override Model fromJson(Map)`）。
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

  test('code=200 且 data 为单对象时解包成 model（钉死现状）', () {
    final r = resp({'code': 200, 'data': {'name': 'A仓库'}});
    final model = decoder.decode<_FakeModel, _FakeModel>(
        response: r, decodeType: _FakeModel());
    expect(model.name, 'A仓库');
  });

  test('code=200 且 data 为 List 时解包成 List（钉死现状）', () {
    final r = resp({'code': 200, 'data': [{'name': 'a'}, {'name': 'b'}]});
    final list = decoder.decode<_FakeModel, List<_FakeModel>>(
        response: r, decodeType: _FakeModel());
    expect(list.length, 2);
    expect(list.first.name, 'a');
  });

  test('code!=200 时抛 NetException 且 code/message 透传（钉死现状）', () {
    final r = resp({'code': 400, 'errorMsg': '出错了'});
    expect(
      () => decoder.decode<_FakeModel, _FakeModel>(
          response: r, decodeType: _FakeModel()),
      throwsA(isA<NetException>()
          .having((e) => e.code, 'code', 400)
          .having((e) => e.message, 'message', '出错了')),
    );
  });

  // 钉死跨端契约漂移（x-contract 的 critical 项）：后端 ResponseResult 的字段是 `msg`
  // （在 Loggi_server 全仓 grep `errorMsg` 为 0 命中），而 decoder 只读 `errorMsg`，
  // 于是后端错误文案永远丢失，前端只会看到兜底的“请求出错”。
  // 这是当前真实行为，不是本 Slice 要修的——等 S18 契约对齐时本测试会变红。
  test('后端真实错误体用 msg 而非 errorMsg，错误文案被丢弃（钉死已知 bug）', () {
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
