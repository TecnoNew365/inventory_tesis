import 'package:flutter/material.dart';

abstract class AppColors {
  static const blueForDarkMode = Color.fromARGB(255, 80, 135, 230);
  static const red = Color(0xffB11C1C);
  static const platinum = Color(0xfff6f6f6);
  static const lightGrey = Color(0xffe5e5e7);
  static const mediumGrey = Color(0xff808084);
  static const black = Color.fromARGB(255, 25, 25, 27);

  //For client
  static const primaryOrange = Color(0xffFF931E);
  static const primaryBlue = Color(0xff1F2A62);
  static const lightOrange = Color.fromRGBO(251, 227, 195, 1);
  static const green = Color(0xff7CB526);
  static const grey = Color(0xff606060);
  //
}

Color getPrimaryColorByTheming(
  BuildContext context, {
  Color? lightColor,
  Color? darkColor,
}) {
  if (Theme.of(context).brightness == Brightness.light) {
    return lightColor ?? Theme.of(context).primaryColor;
  } else {
    return darkColor ?? Colors.white;
  }
}
