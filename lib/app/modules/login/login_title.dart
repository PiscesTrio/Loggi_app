import 'package:flutter/material.dart';

import '../../../l10n/l10n.dart';
import '../../theme/color_palette.dart';

/// The two lines above the login form.
///
/// Extracted from `view.dart` so it can be laid out in a test. `LoginPage` is a
/// `GetView<LoginController>` that reads `GetStorage` in its constructor, which a widget test
/// cannot pump without standing up the whole GetX graph — and the property worth testing here
/// is a property of text against a box, so the box is all the test needs.
///
/// The name and the sentence are treated differently on purpose. "Loggi" is the product's
/// name and stays identical in every language, for the same reason driver names, plates and
/// warehouse names do: it is content, not interface. Only the line under it is translated.
///
/// The second line is 20px rather than the name's 40px. The screen is 480 logical pixels
/// wide — the device reports 720 at density 240, which is a devicePixelRatio of 1.5 — and
/// spends 36 a side on padding, so the title has 408 to work with. In Nunito:
///
///     en  Logistics Management System   @40  547dp   <- wraps
///                                       @20  273dp
///     ja  物流管理システム                 @20  160dp
///     zh  物流管理系统                    @20  120dp
///
/// Two things about arriving at those numbers are worth keeping. The guess going in was that
/// Japanese would be the tight one because its glyphs are full-width; it is not close, and
/// the long Latin string is the only one that has ever been at risk. And the first set of
/// measurements was taken in a widget test without fonts loaded, where every glyph is a 1em
/// box — that reports this string at 1093dp and the Japanese one at 320dp, both wrong, and
/// in opposite directions. `layout_fits_every_language_test` now loads Nunito and renders at
/// the device's real 480, and fails if any language's subtitle takes more than one line.
class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Loggi',
          style: TextStyle(fontFamily: 'Nunito', fontSize: 40),
        ),
        Text(
          context.l10n.loginSubtitle,
          style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 20,
            color: ColorPalette.nileBlue.withValues(alpha: 0.72),
          ),
        ),
      ],
    );
  }
}
