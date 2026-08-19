import 'package:flutter/material.dart';

import '../../app/theme/color_palette.dart';

/// The rounded bar at the top of a full-screen page.
///
/// Four screens drew it — chart, settings and the two logs — each with its own copy of the
/// same padding, radius, colour and 28pt Nunito title, and each recomputing the same
/// truncation. Writing it a fifth time while migrating them would have been the wrong
/// direction.
class PageHeader extends StatelessWidget {
  const PageHeader({super.key, required this.title, this.onBack});

  final String title;

  /// Shown as a chevron on the left when given. The logs have one because they are pushed
  /// on top of settings; the tabs at the root of a branch do not.
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 15),
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
        mainAxisAlignment: onBack == null
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          if (onBack != null)
            IconButton(
              icon: const Icon(Icons.chevron_left_rounded, size: 35),
              onPressed: onBack,
            ),
          Padding(
            // Symmetric, so a header with no back button centres its title on the page. The
            // chart's did not: it carried `fromLTRB(130, …)`, a hardcoded left pad standing
            // in for a back button that had been commented out, which left the title 54px
            // off centre.
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              // The truncation every copy of this header performed. None of the four titles
              // is close to the limit, but a header whose title comes from outside should
              // not assume that.
              title.length > 14 ? '${title.substring(0, 12)}..' : title,
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 28,
                color: ColorPalette.timberGreen,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
