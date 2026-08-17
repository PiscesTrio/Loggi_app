/// A basemap: its tile URL, its required attribution and its zoom ceiling, bound
/// together in one value.
///
/// They are bound deliberately. Attribution is a licence obligation, not
/// decoration, and the way it gets violated is always the same — someone swaps
/// the URL and forgets the credit line. Keeping them in one const object makes
/// that mistake impossible to express.
///
/// Why there is no `fallbackUrl` here, even though flutter_map offers one:
/// GSI serves tiles for Japan only, but outside Japan it does not fail cleanly.
/// Measured: z10 over Busan returns HTTP 200 with a 317-byte solid-colour PNG —
/// South Korea rendered as open sea. flutter_map only falls back when the tile
/// provider *throws*, and a valid 200 never throws, so the fallback would not
/// fire where it is most needed. Where it does fire (a genuine 404) the result is
/// worse: OpenStreetMap imagery on screen under a GSI credit line, with the
/// ODbL-required OSM attribution missing. Switching basemap therefore means
/// switching the whole [MapTileSource], never just the URL.
class MapTileSource {
  final String urlTemplate;
  final String attribution;
  final double maxZoom;

  const MapTileSource({
    required this.urlTemplate,
    required this.attribution,
    required this.maxZoom,
  });

  /// Geospatial Information Authority of Japan, pale style. Japanese place names,
  /// no API key, no account, no rate-limit registration. Japan only.
  static const MapTileSource gsiPale = MapTileSource(
    urlTemplate: 'https://cyberjapandata.gsi.go.jp/xyz/pale/{z}/{x}/{y}.png',
    attribution: '出典：国土地理院',
    maxZoom: 18,
  );

  /// Global coverage, used while the seeded coordinates are not yet Japanese —
  /// GSI would render those as a blank sheet, which reads as "broken" rather than
  /// "not seeded". Place names are localised by OSM, not necessarily Japanese.
  static const MapTileSource osmStandard = MapTileSource(
    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
    attribution: '© OpenStreetMap contributors',
    maxZoom: 19,
  );
}
