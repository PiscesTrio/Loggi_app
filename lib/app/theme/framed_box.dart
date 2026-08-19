import 'package:flutter/material.dart';

import 'color_palette.dart';

/// The white rounded frame the forms in this app are drawn with.
///
/// It was repeated inline around every field and button — the same nine lines of
/// `BoxDecoration` written out each time, which is why a rewrite that used Material's
/// default underline fields changed how three screens looked without changing a line of
/// styling: there was no styling to carry over, only a shape that had been copied.
class FramedBox extends StatelessWidget {
  const FramedBox({super.key, required this.child, this.height = 50});

  final Widget child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: ColorPalette.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 3),
            blurRadius: 6,
            color: ColorPalette.nileBlue.withValues(alpha: 0.1),
          ),
        ],
      ),
      child: child,
    );
  }
}

/// A borderless field that fills its [FramedBox].
InputDecoration framedFieldDecoration(String hint) => InputDecoration(
  border: InputBorder.none,
  hintText: hint,
  filled: true,
  fillColor: Colors.transparent,
  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
  hintStyle: TextStyle(
    fontFamily: 'Nunito',
    fontSize: 16,
    color: ColorPalette.nileBlue.withValues(alpha: 0.58),
  ),
);

const framedFieldTextStyle = TextStyle(
  fontFamily: 'Nunito',
  fontSize: 16,
  color: ColorPalette.nileBlue,
);
