import 'package:get_storage/get_storage.dart';

class TokenStorage {
  final box = GetStorage();
  bool isLoggedIn({ String? token}) {
    switch (token??box.read("token")) {
      case "not logged in":
        return false;
      case null:
        return false;
      default:
        return true;
    }
  }
  void setToken( {required String tokenString}){
    box.write("token", tokenString);
    
  }

  void printToken(){
    
    print(box.read("token"));
  }
  String getToken(){
    return  box.read("token");
  }
}
