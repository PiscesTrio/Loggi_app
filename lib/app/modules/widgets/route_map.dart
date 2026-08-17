import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../data/map/map_tile_source.dart';
import '../../theme/color_palette.dart';

/// Marker icons. Named here rather than at each call site so the origin/current/
/// destination roles stay consistent across the inline and fullscreen maps.
const String kIconStart = 'lib/assets/map_icons/start.png';
const String kIconCurrent = 'lib/assets/map_icons/loca.png';
const String kIconEnd = 'lib/assets/map_icons/end.png';

/// One point on a route. Coordinates are nullable AND may be (0,0): the backend
/// declares lat/lng as primitive doubles, so "missing" is serialised as 0.0 and
/// never as null. Both cases mean the same thing here and are filtered together.
class RoutePoint {
  final double? lat;
  final double? lng;
  final String iconAsset;

  const RoutePoint(this.lat, this.lng, this.iconAsset);

  bool get isUsable =>
      lat != null && lng != null && !(lat == 0 && lng == 0);

  LatLng get latLng => LatLng(lat!, lng!);
}

/// One of only two files that import `package:flutter_map`; the other is
/// [RouteMapFullscreen].
///
/// That containment was the point, and it paid: the 4.x to 8.x migration was a
/// breaking one, and the analyzer reported every break inside these two files and
/// nowhere else.
///
/// The embedded map is deliberately NOT interactive. Disabling the interaction
/// flags cannot prevent the gesture arena from being entered — ScaleGestureRecognizer
/// is registered unconditionally and claims team captaincy — so an embedded map
/// inside a scrolling list can end up winning the gesture while doing nothing with
/// it, leaving a region that neither pans the map nor scrolls the list. The scroll
/// wheel is covered by the same `none`, which matters because it would otherwise
/// swallow the wheel from the surrounding list. Interaction lives in
/// [RouteMapFullscreen].
class RouteMap extends StatelessWidget {
  final List<RoutePoint> points;
  final double height;
  final MapTileSource source;
  final VoidCallback? onExpand;

  const RouteMap({
    Key? key,
    required this.points,
    this.height = 220,
    this.source = MapTileSource.gsiPale,
    this.onExpand,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usable = points.where((p) => p.isUsable).toList();

    if (usable.isEmpty) {
      return SizedBox(
        height: height,
        child: Center(
          child: Text(
            '位置情報がありません',
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 15,
              color: ColorPalette.nileBlue.withOpacity(0.58),
            ),
          ),
        ),
      );
    }

    final coords = usable.map((p) => p.latLng).toList();

    return SizedBox(
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            FlutterMap(
              // The initial bounds fit happens once and only once, guarded inside
              // flutter_map. The status list arrives asynchronously, so without a
              // key tied to the coordinates a newly added point would land outside
              // a camera that never re-frames. Rebuilding is safe precisely because
              // this map is non-interactive: there is no user-adjusted viewport to
              // throw away.
              key: ValueKey(coords.map((c) => '${c.latitude},${c.longitude}').join('|')),
              options: MapOptions(
                initialCameraFit: CameraFit.bounds(
                  bounds: LatLngBounds.fromPoints(coords),
                  padding: const EdgeInsets.all(48),
                  // A single point, or from == to, gives a degenerate bounds whose
                  // computed zoom is infinite; this clamps it to something sane.
                  maxZoom: 15,
                ),
                maxZoom: source.maxZoom,
                interactionOptions:
                    const InteractionOptions(flags: InteractiveFlag.none),
              ),
              children: [
                TileLayer(
                  urlTemplate: source.urlTemplate,
                  userAgentPackageName: 'com.example.loggi_app',
                  maxZoom: source.maxZoom,
                ),
                if (coords.length >= 2)
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: coords,
                        strokeWidth: 3,
                        color: ColorPalette.timberGreen.withOpacity(0.75),
                      ),
                    ],
                  ),
                MarkerLayer(markers: _markers(usable)),
              ],
            ),
            if (coords.length >= 2)
              Positioned(left: 8, top: 8, child: _chip(_distanceLabel(coords))),
            Positioned(right: 6, bottom: 4, child: _attribution()),
            if (onExpand != null)
              Positioned(
                right: 6,
                top: 6,
                child: Material(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(8),
                  child: IconButton(
                    iconSize: 20,
                    tooltip: '全画面表示',
                    icon: const Icon(Icons.fullscreen),
                    color: ColorPalette.nileBlue,
                    onPressed: onExpand,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  List<Marker> _markers(List<RoutePoint> usable) {
    return usable
        .map((p) => Marker(
              point: p.latLng,
              width: 44,
              height: 44,
              // The default centres the icon ON the point; these are pin graphics
              // whose tip is at the bottom, so they must sit above it. Alignment
              // here names where the marker goes relative to the point, so
              // topCenter puts the whole widget above it — the inverse of how it
              // reads at first glance.
              alignment: Alignment.topCenter,
              child: Image.asset(p.iconAsset),
            ))
        .toList();
  }

  /// Straight-line distance — the polyline is a direct line, not a driving route,
  /// so calling it 配送距離 would be a lie about what is drawn.
  static String _distanceLabel(List<LatLng> coords) {
    const distance = Distance();
    var metres = 0.0;
    for (var i = 0; i < coords.length - 1; i++) {
      metres += distance.as(LengthUnit.Meter, coords[i], coords[i + 1]);
    }
    return '直線距離 約 ${(metres / 1000).toStringAsFixed(0)} km';
  }

  Widget _chip(String text) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.88),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 12,
            color: ColorPalette.nileBlue,
          ),
        ),
      );

  Widget _attribution() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        color: Colors.white.withOpacity(0.72),
        child: Text(
          source.attribution,
          style: const TextStyle(fontSize: 10, color: Colors.black87),
        ),
      );
}
