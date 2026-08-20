import 'package:flutter/material.dart';

import '../../../l10n/l10n.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loggi_app/app/modules/widgets/driver_card.dart';

import '../../theme/color_palette.dart';
import '../widgets/async_view.dart';
import 'providers.dart';

/// The driver list.
///
/// `controller.obx(...)` took one builder — the success case — and rendered nothing
/// meaningful for the other two. Since a failed request arrived as `success` with a null
/// list, "failed" and "empty" looked the same, and the only hint either had happened was a
/// `debugPrint` nobody sees on a device.
class DriverListPage extends ConsumerWidget {
  const DriverListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drivers = ref.watch(driverListProvider);
    return Scaffold(
      body: Container(
        color: ColorPalette.aquaHaze,
        child: RefreshIndicator(
          onRefresh: () => ref.read(driverListProvider.notifier).refresh(),
          child: AsyncView(
            value: drivers,
            onRetry: () => ref.invalidate(driverListProvider),
            emptyMessage: context.l10n.emptyDrivers,
            builder: (data) => ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) =>
                  DriverCard(driver: data[index], imageIndex: index),
            ),
          ),
        ),
      ),
    );
  }
}
