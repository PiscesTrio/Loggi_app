import 'package:flutter/material.dart';

import '../../../l10n/l10n.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loggi_app/app/modules/widgets/distribution_status_item.dart';

import '../../data/api/distribution_vo.dart';

import '../../theme/color_palette.dart';
import '../widgets/async_view.dart';
import '../widgets/route_map.dart';
import '../widgets/route_map_fullscreen.dart';
import 'providers.dart';

class DistributionStatusPage extends ConsumerWidget {
  const DistributionStatusPage({super.key, required this.argument});

  final DistributionVo argument;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = context.l10n.trackTitle;
    // The timeline is asked for by id. The old screen assigned the order onto the
    // controller from inside build() and the controller fetched in onReady, one frame
    // later — an ordering that held by luck and dereferenced `id!` if it ever did not.
    final statuses = ref.watch(distributionStatusProvider(argument.id ?? ''));

    // A second AMapWidget used to be built here on every frame and then thrown
    // away — it was never inserted into the widget tree, yet it asserted non-null
    // on four coordinates while being constructed, so a distribution with any
    // missing coordinate crashed this screen on behalf of something invisible.

    return Builder(
      builder: (_) {
        return Scaffold(
          body: Container(
            color: ColorPalette.pacificBlue,
            child: SafeArea(
              child: Container(
                color: ColorPalette.aquaHaze,
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 10,
                        right: 15,
                      ),
                      width: double.infinity,
                      height: 70,
                      decoration: const BoxDecoration(
                        color: ColorPalette.pacificBlue,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.chevron_left_rounded,
                              size: 35,
                            ),
                            onPressed: () {
                              context.pop();
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                            child: Text(
                              // Was a field initialised with a literal, which a
                              // localised string cannot be: there is no context yet when
                              // the widget is constructed.
                              title.length > 14
                                  ? '${title.substring(0, 12)}..'
                                  : title,
                              style: const TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 28,
                                color: ColorPalette.timberGreen,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: SizedBox(
                          child: RefreshIndicator(
                            onRefresh: () async => ref.invalidate(
                              distributionStatusProvider(argument.id ?? ''),
                            ),
                            child: ListView(
                              children: [
                                // No InteractiveViewer: RouteMap runs its own
                                // gesture handling, and wrapping it would put
                                // the two in competition.
                                AsyncView(
                                  value: statuses,
                                  onRetry: () => ref.invalidate(
                                    distributionStatusProvider(
                                      argument.id ?? '',
                                    ),
                                  ),
                                  builder: (data) {
                                    // data![0] used to be read three times; an
                                    // empty status list threw RangeError before
                                    // the map could render.
                                    final latest = data.isNotEmpty
                                        ? data.first
                                        : null;
                                    final points = <RoutePoint>[
                                      RoutePoint(
                                        argument.fromLat,
                                        argument.fromLng,
                                        kIconStart,
                                      ),
                                      if (latest != null)
                                        RoutePoint(
                                          latest.lat,
                                          latest.lng,
                                          kIconCurrent,
                                        ),
                                      RoutePoint(
                                        argument.toLat,
                                        argument.toLng,
                                        kIconEnd,
                                      ),
                                    ];
                                    return RouteMap(
                                      points: points,
                                      height:
                                          MediaQuery.of(context).size.height *
                                          0.4,
                                      onExpand: () =>
                                          Navigator.of(
                                            context,
                                            rootNavigator: true,
                                          ).push(
                                            MaterialPageRoute<void>(
                                              builder: (_) =>
                                                  RouteMapFullscreen(
                                                    points: points,
                                                  ),
                                            ),
                                          ),
                                    );
                                  },
                                ),
                                AsyncView(
                                  value: statuses,
                                  emptyMessage:
                                      context.l10n.emptyDistributionStatus,
                                  builder: (data) => ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: data.length,
                                    itemBuilder: (context, index) {
                                      return DistributionStatusItem(
                                        distribution: argument,
                                        distributionStatus: data[index],
                                        isTop: index == 0,
                                        isBottom: index == data.length - 1,
                                        isStart: data.length == 1,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
