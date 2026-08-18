
import 'package:flutter_nb_net/flutter_net.dart';



/// Custom decoder
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
        // debugPrint(response.data.toString());
    var errorCode = response.data['code'];
    /// Request succeeded
    if (errorCode == 200) {
      var data = response.data['data'];
      if (data is List) {

       

        var dataList = List<T>.from(
            data.map((item) => decodeType.fromJson(item)).toList()) as K;
        
        return dataList;

      } else {
        var model = decodeType.fromJson(data) as K;
        return model;
        
      }
    } else {

      
      var errorMsg = response.data['errorMsg'];
     throw NetException(errorMsg, errorCode);
    }
  }
}