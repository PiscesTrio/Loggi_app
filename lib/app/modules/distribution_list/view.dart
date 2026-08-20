import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loggi_app/app/router/routes.dart';

import '../../theme/color_palette.dart';
import '../widgets/async_view.dart';
import '../widgets/distribution_card.dart';
import 'providers.dart';

class DistributionListPage extends ConsumerWidget {
  const DistributionListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final distributions = ref.watch(distributionListProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(Routes.distributionApply),
        splashColor: ColorPalette.bondyBlue,
        backgroundColor: ColorPalette.pacificBlue,
        child: const Icon(Icons.add, color: ColorPalette.white),
      ),
      body: Container(
        color: ColorPalette.aquaHaze,
        child: RefreshIndicator(
          onRefresh: () =>
              ref.read(distributionListProvider.notifier).refresh(),
          child: AsyncView(
            value: distributions,
            onRetry: () => ref.invalidate(distributionListProvider),
            emptyMessage: '暂无配送单',
            builder: (data) => ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) =>
                  DistributionCard(distribution: data[index]),
            ),
          ),
        ),
      ),
    );
  }
}
