import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        minimumSize: const Size(30.0, tButtonHeight),
        elevation: 0,
        primary: tSecondaryColor,
        side: const BorderSide(color: tSecondaryColor),
        padding: const EdgeInsets.symmetric(
            vertical: tButtonHeight, horizontal: tButtonHeight),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
  );

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        elevation: 0,
        primary: tPrimaryColor,
        side: const BorderSide(color: tPrimaryColor),
        padding: const EdgeInsets.symmetric(vertical: tButtonHeight),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
  );
}
