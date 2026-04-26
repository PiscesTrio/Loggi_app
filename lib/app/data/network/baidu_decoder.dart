import 'package:flutter_nb_net/flutter_net.dart';

/// 自定义解码器
class BaiduDecoder extends NetDecoder {
  /// 单例对象
  static final BaiduDecoder _instance = BaiduDecoder._internal();
  /// 内部结构办法，可防止外部暴露结构函数，进行实例化
  BaiduDecoder._internal();
  /// 工厂结构办法，这儿运用命名结构函数方式进行声明
  factory BaiduDecoder.getInstance() => _instance;
  @override
  K decode<T extends BaseNetModel, K>(
      {required Response<dynamic> response, required T decodeType}) {
  
    return decodeType.fromJson(response.data);
  }
}