import 'package:flutter/material.dart';

class Go {
  Go._();

  // ignore: non_constant_identifier_names
  static void To(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  // ignore: non_constant_identifier_names
  static void NavigateReplacement(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  // ignore: non_constant_identifier_names
  static void BackTo(BuildContext context, String routeName) {
    Navigator.popAndPushNamed(context, routeName);
  }

  static void back(BuildContext context) {
    Navigator.pop(context);
  }
}
