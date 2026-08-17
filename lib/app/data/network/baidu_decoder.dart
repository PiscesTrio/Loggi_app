import 'package:flutter_nb_net/flutter_net.dart';

/// Custom decoder
class BaiduDecoder extends NetDecoder {
  /// Singleton instance
  static final BaiduDecoder _instance = BaiduDecoder._internal();
  /// Private constructor, so the class cannot be instantiated from outside
  BaiduDecoder._internal();
  /// Factory constructor, declared here via the named-constructor form
  factory BaiduDecoder.getInstance() => _instance;
  @override
  K decode<T extends BaseNetModel, K>(
      {required Response<dynamic> response, required T decodeType}) {
  
    return decodeType.fromJson(response.data);
  }
}