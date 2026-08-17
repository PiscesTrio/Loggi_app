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
const List<DeliveryPoint> kDeliveryPoints = <DeliveryPoint>[
  DeliveryPoint('東京都千代田区丸の内1-9-1', 35.6812, 139.7671),
  DeliveryPoint('大阪府大阪市北区梅田3-1-1', 34.7025, 135.4959),
  DeliveryPoint('愛知県名古屋市中村区名駅1-1-4', 35.1706, 136.8816),
  DeliveryPoint('福岡県福岡市博多区博多駅中央街1-1', 33.5902, 130.4207),
  DeliveryPoint('北海道札幌市北区北六条西4-1', 43.0686, 141.3508),
];
