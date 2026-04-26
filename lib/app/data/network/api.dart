import 'package:loggi_app/app/data/models/login_log.dart';
import 'package:loggi_app/app/data/models/syslog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_nb_net/flutter_net.dart';
import '../models/baiduLocationTextNLP.dart';
import '../models/index.dart';
import '../models/inventory_record.dart';
import 'baidu_decoder.dart';

class NbRequest {
  Future<List<Warehouse>?> requestGet4() async {
    var appResp = await get<Warehouse, List<Warehouse>>("/warehouse",
        decodeType: Warehouse());
    return appResp.when(success: (List<Warehouse> model) {
      var size = model.length;
      debugPrint("成功返回$size条");
      return model;
    }, failure: (String msg, int code) {
      debugPrint("失败了：msg=$msg/code=$code");
      return null;
    });
  }

  Future<bool> saveWarehouse(Warehouse data) async {
    var appResp = await post("/warehouse", data: data);
    return appResp.when(success: (model) {
      debugPrint("OK!");
      return true;
    }, failure: (String msg, int code) {
      debugPrint(msg);
      return false;
    });
  }

  Future<List<Product>?> getAllProducts() async {
    var appResp =
        await get<Product, List<Product>>("/commodity", decodeType: Product());
    return appResp.when(success: (List<Product> model) {
      var size = model.length;
      debugPrint("成功返回$size条");
      return model;
    }, failure: (String msg, int code) {
      debugPrint("失败了：msg=$msg/code=$code");
      return null;
    });
  }
   Future<List<LoginLog>?> getLoginLog() async {
    var appResp =
        await get<LoginLog, List<LoginLog>>("/loginlog", decodeType: LoginLog());
    return appResp.when(success: (List<LoginLog> model) {
      var size = model.length;
      debugPrint("成功返回$size条");
      return model;
    }, failure: (String msg, int code) {
      debugPrint("失败了：msg=$msg/code=$code");
      return null;
    });
  }

  Future<bool> saveProduct(Product data) async {
    var appResp = await post("/commodity", data: data);
    return appResp.when(success: (model) {
      debugPrint("OK!");
      return true;
    }, failure: (String msg, int code) {
      debugPrint(msg);
      return false;
    });
  }

  Future<bool> updateProduct(Product data) async {
    var appResp = await put("/commodity", data: data);
    return appResp.when(success: (model) {
      debugPrint("OK!");
      return true;
    }, failure: (String msg, int code) {
      debugPrint(msg);
      return false;
    });
  }

  Future<Distribution?> updateDistribution(Distribution data) async {
    var appResp = await post<Distribution,Distribution>("/distribution", data: data,decodeType: Distribution());
    return appResp.when(success: (Distribution model) {
      debugPrint("OK!");
      return model;
    }, failure: (String msg, int code) {
      debugPrint(msg);
      return null;
    });
  }

  Future<List<Inventory>?> getInventoryFromWarehouseId(String id) async {
    var appResp = await get<Inventory, List<Inventory>>(
        "/inventory/warehouse/$id",
        decodeType: Inventory());
    return appResp.when(success: (List<Inventory> model) {
      var size = model.length;
      debugPrint("成功返回$size条");
      return model;
    }, failure: (String msg, int code) {
      debugPrint("失败了：msg=$msg/code=$code");
      return null;
    });
  }

  Future<List<Distribution>?> getDistribution() async {
    var appResp = await get<Distribution, List<Distribution>>("/distribution",
        decodeType: Distribution());
    return appResp.when(success: (List<Distribution> model) {
      var size = model.length;
      debugPrint("成功返回$size条");
      return model;
    }, failure: (String msg, int code) {
      debugPrint("失败了：msg=$msg/code=$code");
      return null;
    });
  }

  Future<Available?> findAvailable() async {
    var appResp = await get<Available, Available>("/distribution/can",
        decodeType: Available());
    return appResp.when(success: (Available model) {
      return model;
    }, failure: (String msg, int code) {
      debugPrint("失败了：msg=$msg/code=$code");
      return null;
    });
  }

  Future<List<Vehicle>?> getVehicles() async {
    var appResp =
        await get<Vehicle, List<Vehicle>>("/vehicle", decodeType: Vehicle());
    return appResp.when(success: (List<Vehicle> model) {
      return model;
    }, failure: (String msg, int code) {
      debugPrint("失败了：msg=$msg/code=$code");
      return null;
    });
  }

  Future<List<Driver>?> getDrivers() async {
    var appResp =
        await get<Driver, List<Driver>>("/driver", decodeType: Driver());
    return appResp.when(success: (List<Driver> model) {
      return model;
    }, failure: (String msg, int code) {
      debugPrint("失败了：msg=$msg/code=$code");
      return null;
    });
  }

  Future<bool> saveVehicle(Vehicle data) async {
    var appResp = await post("/vehicle", data: data);
    return appResp.when(success: (model) {
      debugPrint("OK!");
      return true;
    }, failure: (String msg, int code) {
      debugPrint(msg);
      return false;
    });
  }

   Future<bool> submitStatus(DistributionStatus data) async {
    var appResp = await post("/distribution/status", data: data);
    return appResp.when(success: (model) {
      debugPrint("OK!");
      return true;
    }, failure: (String msg, int code) {
      debugPrint(msg);
      return false;
    });
  }

  Future<bool> importAndExport(InventoryRecord data ,bool inOrOut) async {
    var appResp = await post("/inventory/${inOrOut?"in":"out"}", data: data);
    return appResp.when(success: (model) {
      debugPrint("OK!");
      return true;
    }, failure: (String msg, int code) {
      debugPrint(msg);
      return false;
    });
  }

  Future<LoginResp?>login(LoginDto data)async{
    var appResp =
    await post<LoginResp,LoginResp>("/admin/login?type=password",decodeType: LoginResp(),data: data);
    return appResp.when(success: (LoginResp model){
      debugPrint("LOGIN OK!");
      return model;
    }, failure: (String msg, int code) {
      debugPrint("失败了：msg=$msg/code=$code");
      return null;
    });
  }

    Future<List<DistributionStatus>?> getStatus(String disId) async {
    var appResp =
        await get<DistributionStatus, List<DistributionStatus>>("/distribution/status", decodeType: DistributionStatus(),queryParameters: {"dis":disId});
    return appResp.when(success: (List<DistributionStatus> model) {
      return model;
    }, failure: (String msg, int code) {
      debugPrint("失败了：msg=$msg/code=$code");
      return null;
    });
  }

  Future<List<CommdityVo>?> getChartData(bool inOrOut) async {
    var appResp =
        await get<CommdityVo, List<CommdityVo>>("/inventory/analyze", decodeType: CommdityVo(),queryParameters: {"type":inOrOut?1:-1});
    return appResp.when(success: (List<CommdityVo> model) {
      return model;
    }, failure: (String msg, int code) {
      debugPrint("失败了：msg=$msg/code=$code");
      return null;
    });
  }

    Future<List<SysLog>?> getSysLog() async {
    var appResp =
        await get<SysLog, List<SysLog>>("/systemlog", decodeType: SysLog());
    return appResp.when(success: (List<SysLog> model) {
      return model;
    }, failure: (String msg, int code) {
      debugPrint("失败了：msg=$msg/code=$code");
      return null;
    });
  }


    Future<NlpLocation?> textToLocation(String text) async{
    var appResp = await get<NlpLocation,NlpLocation>("https://aip.baidubce.com/rpc/2.0/nlp/v1/address?access_token=24.5f99d8b94c33c1005dd5fb7ff9046ee8.2592000.1686244822.282335-33361726",queryParameters: {"text":text}, decodeType: NlpLocation(),httpDecode: BaiduDecoder.getInstance());
    return appResp.when(success: (NlpLocation model){
              return model;
    }, failure: (String msg, int code) {
      debugPrint("失败了：msg=$msg/code=$code");
      return null;
    });
  }



}
