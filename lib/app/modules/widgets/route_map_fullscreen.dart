import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import '../../data/map/map_tile_source.dart';
import '../../theme/color_palette.dart';
import 'route_map.dart';

/// The interactive counterpart of [RouteMap].
///
/// Interaction lives here rather than in the embedded map so it never competes
/// with the scrolling list around it. Rotation is left out on purpose: a rotated
/// map breaks the north-up assumption people read a delivery route with, and
/// flutter_map 4 offers no double-tap zoom-*out*, so a user who rotates or zooms
/// in has no obvious way back — on a full-screen page they can simply close it.
class RouteMapFullscreen extends StatelessWidget {
  final List<RoutePoint> points;
  final MapTileSource source;
  final String title;

  const RouteMapFullscreen({
    Key? key,
    required this.points,
    this.source = MapTileSource.gsiPale,
    this.title = '配送ルート',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usable = points.where((p) => p.isUsable).toList();
    final coords = usable.map((p) => p.latLng).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title,
            style: const TextStyle(fontFamily: 'Nunito', fontSize: 18)),
        backgroundColor: ColorPalette.white,
        foregroundColor: ColorPalette.nileBlue,
        elevation: 1,
      ),
      body: coords.isEmpty
          ? const Center(child: Text('位置情報がありません'))
          : Stack(
              children: [
                FlutterMap(
                  options: MapOptions(
                    bounds: LatLngBounds.fromPoints(coords),
                    boundsOptions: const FitBoundsOptions(
                      padding: EdgeInsets.all(64),
                      maxZoom: 15,
                    ),
                    maxZoom: source.maxZoom,
                    interactiveFlags:
                        InteractiveFlag.all & ~InteractiveFlag.rotate,
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
                            strokeWidth: 4,
                            color: ColorPalette.timberGreen.withOpacity(0.75),
                          ),
                        ],
                      ),
                    MarkerLayer(
                      markers: usable
                          .map((p) => Marker(
                                point: p.latLng,
                                width: 44,
                                height: 44,
                                anchorPos: AnchorPos.align(AnchorAlign.top),
                                builder: (_) => Image.asset(p.iconAsset),
                              ))
                          .toList(),
                    ),
                  ],
                ),
                Positioned(
                  right: 6,
                  bottom: 4,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    color: Colors.white.withOpacity(0.72),
                    child: Text(
                      source.attribution,
                      style: const TextStyle(
                          fontSize: 10, color: Colors.black87),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
