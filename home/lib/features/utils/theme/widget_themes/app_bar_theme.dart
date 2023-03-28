import 'package:flutter/material.dart';
import 'package:home/constants/colors.dart';

class TAppBarTheme {
  TAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Colors.black),
  );

  static const darkAppBarTheme = AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: tPrimaryColor),
  );
}
