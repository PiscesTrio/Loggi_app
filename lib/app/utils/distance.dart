

import 'dart:math';

class LatLngDistance {


    double getDistance(double lat1, double lng1, double lat2, double lng2) {
  	/// 单位：米
  	/// def ：地球半径
  	double def = 6378.137;
    double radLat1 = _rad(lat1);
    double radLat2 = _rad(lat2);
    double a = radLat1 - radLat2;
    double b = _rad(lng1) - _rad(lng2);
    double s = 2 * asin(sqrt(pow(sin(a / 2), 2) + cos(radLat1) * cos(radLat2) * pow(sin(b / 2), 2)));
    print((s * def ).roundToDouble());
    return (s * def ).roundToDouble();
  }

  double _rad(double d) {
    return d * pi / 180.0;
  }

  double scale2Zoom(double scale) {
        if (scale <= 2.5) {
          return 14.7;
        } else if (scale <= 5) {
          return 13.7;
        } else if (scale <= 10) {
          return 12.7;
        } else if (scale <= 50) {
          return 10.4;
        } else if (scale <= 100) {
          return 9.4;
        } else if (scale <= 150) {
          return 8.8;
        } else if (scale <= 250) {
          return 8;
        } else if (scale <= 500) {
          return 7;
        } else if (scale <= 1000) {
          return 6;
        }else if (scale <= 2000) {
          return 5.19;
        } 
        else if (scale > 2500) {
          return 4.7;
        } 

        return 4;
    }

}