/// Selectable delivery destinations for a new distribution request.
///
/// This replaces the Baidu NLP geocoder that used to turn a free-text address
/// into coordinates. That call could never succeed: its access token was stripped
/// from the repository, so every request failed and the caller dereferenced the
/// null result. Even with a valid token it was the wrong tool here — the service
/// returns Chinese administrative divisions (province/city/county/town) and
/// cannot parse a Japanese address.
///
/// Picking from a fixed list is a deliberate downgrade in flexibility, traded for
/// coordinates that are always present and always valid. The map layer needs
/// WGS-84, which is what these are.
class DeliveryPoint {
  final String address;
  final double lat;
  final double lng;

  const DeliveryPoint(this.address, this.lat, this.lng);
}

/// Const so every instance is canonical: DropdownButton compares by identity,
/// so no operator== is needed for the selected value to match a menu item.
/// Fictional addresses.
///
/// The prefecture and ward are real, so a route between two of them still looks like a
/// route someone might drive, but the town name is `ロギ` — this application's own name,
/// which no Japanese address uses — and the coordinates sit in the ward generally rather
/// than on a building. The previous list named Tokyo Station, Umeda, Nagoya Station,
/// Hakata Station and central Sapporo at street-address precision: real places standing in
/// for a made-up company's customers.
///
/// Kept in step with `Loggi_server/src/main/resources/data.sql` by hand — the seeded
/// deliveries point at two of these, and a destination that is not in this list would show
/// an address the dropdown cannot reproduce.
const List<DeliveryPoint> kDeliveryPoints = <DeliveryPoint>[
  DeliveryPoint('東京都江東区ロギ1-1-1', 35.6720, 139.8170),
  DeliveryPoint('大阪府大阪市此花区ロギ2-1-1', 34.6870, 135.4480),
  DeliveryPoint('愛知県名古屋市港区ロギ3-1-1', 35.1080, 136.8590),
  DeliveryPoint('福岡県福岡市東区ロギ7-1-1', 33.6200, 130.4270),
  DeliveryPoint('北海道札幌市白石区ロギ8-1-1', 43.0480, 141.4020),
];
