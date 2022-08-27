import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    indicatorColor: kBackgroundColor,
    backgroundColor: kBackgroundColor,
    canvasColor: kDarkBgColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: lightAppBarTheme,
    splashColor: kBackgroundColor,
    shadowColor: kShadeColor,
    iconTheme: const IconThemeData(color: kIconColor),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: kBlackShadowBgColor,
    backgroundColor: kDarkBgColor,
    canvasColor: kBackgroundColor,
    splashColor: kBlackShadowBgColor,
    indicatorColor: kFreshPrimaryColor,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: darkAppBarTheme,
    shadowColor: kDarkBgColor,
    iconTheme: const IconThemeData(color: kIconColor),
  );
}

const lightAppBarTheme =
    AppBarTheme(centerTitle: false, elevation: 0, color: kPrimaryColor);
const darkAppBarTheme =
    AppBarTheme(centerTitle: false, elevation: 0, color: kBlackShadowBgColor);
