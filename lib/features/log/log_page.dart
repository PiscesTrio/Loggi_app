import '../../l10n/l10n.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../shell/page_header.dart';
import '../../app/modules/widgets/async_view.dart';
import '../../app/modules/widgets/login_log.dart';
import '../../app/modules/widgets/op_log.dart';
import '../../app/theme/color_palette.dart';
import 'providers.dart';

/// A list of log entries under a titled header.
///
/// One page for both logs. The two it replaces were the same eighty lines written twice —
/// the rounded header, the SafeArea, the RefreshIndicator, the ListView — differing in the
/// title, the row widget and which controller they read. Those three are arguments.
class LogPage<T> extends ConsumerWidget {
  const LogPage({
    super.key,
    required this.title,
    required this.provider,
    required this.onRefresh,
    required this.rowBuilder,
  });

  final String title;
  final ProviderListenable<AsyncValue<List<T>>> provider;
  final Future<void> Function(WidgetRef ref) onRefresh;
  final Widget Function(T row) rowBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entries = ref.watch(provider);

    return Scaffold(
      backgroundColor: ColorPalette.pacificBlue,
      body: SafeArea(
        child: ColoredBox(
          color: ColorPalette.aquaHaze,
          child: Column(
            children: [
              PageHeader(title: title, onBack: () => context.pop()),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: () => onRefresh(ref),
                          child: AsyncView(
                            value: entries,
                            onRetry: () => onRefresh(ref),
                            emptyMessage: context.l10n.emptyLogs,
                            builder: (rows) => ListView.builder(
                              itemCount: rows.length,
                              itemBuilder: (context, index) =>
                                  rowBuilder(rows[index]),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 登录日志.
class LoginLogPage extends StatelessWidget {
  const LoginLogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LogPage(
      title: context.l10n.titleLoginLog,
      provider: loginLogProvider,
      onRefresh: (ref) => ref.read(loginLogProvider.notifier).refresh(),
      rowBuilder: (row) => LoginLogsTtem(loginLog: row),
    );
  }
}

/// 操作日志.
class OperationLogPage extends StatelessWidget {
  const OperationLogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LogPage(
      title: context.l10n.titleOperationLog,
      provider: operationLogProvider,
      onRefresh: (ref) => ref.read(operationLogProvider.notifier).refresh(),
      rowBuilder: (row) => OpLogsItem(sysLog: row),
    );
  }
}
