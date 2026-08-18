import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// The four-tab shell.
///
/// What it replaces was an `IndexedStack` whose index came from a GetX controller, holding
/// four children of which three were hand-written `Navigator`s keyed by
/// `Get.nestedKey(70)`, `Get.nestedKey(69)` and so on — magic integers, each with its own
/// `onGenerateRoute` switch listing that tab's routes. A route therefore existed in two
/// places, `app_pages.dart` and the switch, and only the switch knew which tab it belonged
/// to.
///
/// `StatefulShellRoute.indexedStack` is the same idea with the parts named: one branch per
/// tab, each with its own navigator and its own back stack, declared next to the routes it
/// contains.
class HomeShellScaffold extends StatelessWidget {
  const HomeShellScaffold({super.key, required this.shell});

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: shell,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: shell.currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.warehouse_rounded), label: '基础管理'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_shipping_rounded), label: '运输管理'),
          BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart_sharp), label: '图表分析'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '系统设置'),
        ],
        onTap: (index) => shell.goBranch(
          index,
          // Tapping the tab you are already on returns to its root, which is what every
          // platform's tab bar does and what the old IndexedStack could not: it only ever
          // swapped the visible child, so a tab you had drilled into stayed drilled in.
          initialLocation: index == shell.currentIndex,
        ),
      ),
    );
  }
}
