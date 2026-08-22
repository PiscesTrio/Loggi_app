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
/// The second line is 20px rather than the name's 40px, and the reason is measured. Laid out
/// at 40 against the 648 logical pixels this screen has to spend (720 wide, 36 of padding a
/// side):
///
///     zh  物流管理系统                  240px
///     ja  物流管理システム                320px
///     en  Logistics Management System  1080px   <- 432px over
///
/// The guess going in was that Japanese would be the tight one, because its glyphs are
/// full-width. It is not close to tight; the long Latin string is three times wider than
/// either. That is the same shape as the defect this project shipped in S20 — a box sized
/// against the language in front of you — only with the languages swapped, which is why the
/// numbers above are measured rather than reasoned. At 20 the widest is 540px and all three
/// fit. `layout_fits_every_language_test` renders this widget in every language and fails on
/// either overflow or silent truncation.
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
