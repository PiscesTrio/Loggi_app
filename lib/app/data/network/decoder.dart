import 'package:flutter_nb_net/flutter_net.dart';

/// Turns the backend's `{code, status, msg, data}` envelope into a typed model,
/// or into a [NetException] carrying what the backend actually said.
class MyHttpDecoder extends NetDecoder {
  /// Singleton instance
  static final MyHttpDecoder _instance = MyHttpDecoder._internal();

  /// Private constructor that prevents callers from instantiating the class directly.
  MyHttpDecoder._internal();

  /// Factory constructor, declared using named-constructor syntax.
  factory MyHttpDecoder.getInstance() => _instance;

  @override
  K decode<T extends BaseNetModel, K>(
      {required Response<dynamic> response, required T decodeType}) {
    final body = response.data;

    // Not every response body is our envelope. A 404 for an unmapped path, a
    // container-generated 500 page, or an empty body all arrive here now that
    // non-2xx statuses are let through to be decoded, and `body['code']` on a
    // String throws NoSuchMethodError - which _execute does not catch, so it
    // would escape past every failure handler in the app.
    if (body is! Map) {
      throw NetException(
          '服务器返回了无法解析的响应', response.statusCode ?? -1);
    }

    final errorCode = body['code'];

    /// Request succeeded
    if (errorCode == 200) {
      var data = body['data'];
      if (data is List) {
        var dataList = List<T>.from(
            data.map((item) => decodeType.fromJson(item)).toList()) as K;

        return dataList;
      } else {
        var model = decodeType.fromJson(data) as K;
        return model;
      }
    } else {
      // `msg`, not `errorMsg`. The backend has never sent a key by that name, so
      // this read produced null on every single failure and NetException fell
      // back to its own generic "请求出错". Every error message the server took
      // the trouble to write - "库存数量不足", "邮箱或密码错误" - was discarded
      // here, one key name away from the user.
      final errorMsg = body['msg'] as String?;
      throw NetException(errorMsg, errorCode is int ? errorCode : response.statusCode);
    }
  }
}
