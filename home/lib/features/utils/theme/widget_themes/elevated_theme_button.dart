import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        foregroundColor: tWhiteColor,
        backgroundColor: tSecondaryColor,
        elevation: 0,
        side: const BorderSide(color: tSecondaryColor),
        padding: const EdgeInsets.symmetric(vertical: tButtonHeight),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        foregroundColor: tSecondaryColor,
        backgroundColor: tPrimaryColor,
        elevation: 0,
        side: const BorderSide(color: tWhiteColor),
        padding: const EdgeInsets.symmetric(vertical: tButtonHeight),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
  );
}
