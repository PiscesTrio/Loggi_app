import 'dart:io';

import 'package:loggi_app/app/data/models/index.dart';
import 'package:flutter_nb_net/flutter_net.dart';



/// 自定义解码器
class MyHttpDecoder extends NetDecoder {
  /// 单例对象
  static final MyHttpDecoder _instance = MyHttpDecoder._internal();
  /// 内部结构办法，可防止外部暴露结构函数，进行实例化
  MyHttpDecoder._internal();
  /// 工厂结构办法，这儿运用命名结构函数方式进行声明
  factory MyHttpDecoder.getInstance() => _instance;
  @override
  K decode<T extends BaseNetModel, K>(
      {required Response<dynamic> response, required T decodeType}) {
        // debugPrint(response.data.toString());
    var errorCode = response.data['code'];
    /// 恳求成功
    if (errorCode == 200) {
      var data = response.data['data'];
      if (data is List) {

       

        var dataList = List<T>.from(
            data.map((item) => decodeType.fromJson(item)).toList()) as K;
        
        return dataList;

      } else {
        print("not");
        var model = decodeType.fromJson(data) as K;
        return model;
        
      }
    } else {

      
      var errorMsg = response.data['errorMsg'];
     throw NetException(errorMsg, errorCode);
    }
  }
}