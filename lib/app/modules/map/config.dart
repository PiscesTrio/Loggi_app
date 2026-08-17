import 'package:amap_flutter_base/amap_flutter_base.dart';
import 'package:amap_flutter_map/amap_flutter_map.dart';

class ConstConfig {
  ///Your own AMap API key; pass it to [AMapWidget] through the `apiKey` property.
  ///
  ///Note: a key set via [AMapWidget]'s `apiKey` property outranks the one configured
  ///natively, and once set the native key is ignored entirely — use one or the other.
  static const AMapApiKey amapApiKeys = AMapApiKey(
      androidKey: 'YOUR_AMAP_ANDROID_KEY',
      iosKey: '您申请的iOS平台的key');

  ///AMap privacy compliance statement. These are sample values — set
  ///[AMapPrivacyStatement]'s 'hasContains', 'hasShow', 'hasAgree' to reflect what
  ///the app actually does.
  ///
  /// Note: if any one of 'hasContains', 'hasShow', 'hasAgree' is false the AMap SDK
  /// will not work at all, and the map shows up as a blank white screen.
  ///
  /// AMap developer compliance guide: https://lbs.amap.com/agreement/compliance
  ///
  /// AMap SDK compliant usage guide: https://lbs.amap.com/news/sdkhgsy
  static const AMapPrivacyStatement amapPrivacyStatement =
  AMapPrivacyStatement(hasContains: true, hasShow: true, hasAgree: true);
}
