import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'page_header.dart';
import '../../app/theme/color_palette.dart';

/// A titled page whose body is a set of tabs over a nested navigation shell.
///
/// The shell owns which tab is showing — it is part of the route. The page this replaces
/// kept a second copy in a GetX controller's `TabController` and reconciled the two from
/// inside `build()`:
///
///     if (controller.tabController.index != shell.currentIndex) {
///       controller.tabController.index = shell.currentIndex;
///     }
///
/// A write during build, to state the router already holds. The TabController here exists
/// only because `TabBar` needs one; it is driven from the shell in `didUpdateWidget`, which
/// is where reacting to a changed input belongs.
class TabbedShellPage extends StatefulWidget {
  const TabbedShellPage({
    super.key,
    required this.title,
    required this.tabs,
    required this.shell,
  });

  final String title;
  final List<String> tabs;
  final StatefulNavigationShell shell;

  @override
  State<TabbedShellPage> createState() => _TabbedShellPageState();
}

class _TabbedShellPageState extends State<TabbedShellPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs = TabController(
    length: widget.tabs.length,
    vsync: this,
    initialIndex: widget.shell.currentIndex,
  );

  @override
  void didUpdateWidget(TabbedShellPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_tabs.index != widget.shell.currentIndex) {
      _tabs.index = widget.shell.currentIndex;
    }
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.pacificBlue,
      body: SafeArea(
        child: ColoredBox(
          color: ColorPalette.aquaHaze,
          child: Column(
            children: [
              PageHeader(title: widget.title),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      TabBar(
                        controller: _tabs,
                        onTap: (i) => widget.shell.goBranch(
                          i,
                          initialLocation: i == widget.shell.currentIndex,
                        ),
                        tabs: [for (final tab in widget.tabs) Tab(text: tab)],
                      ),
                      const SizedBox(height: 20),
                      Expanded(child: widget.shell),
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
