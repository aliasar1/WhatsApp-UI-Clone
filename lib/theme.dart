import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    indicatorColor: kBackgroundColor,
    backgroundColor: kBackgroundColor,
    canvasColor: kDarkBgColor,
    disabledColor: kYellowColor,
    textSelectionColor: kDarkGreyColor,
    focusColor: kReceiverMessageColor,
    buttonColor: kDarkGreyColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: lightAppBarTheme,
    highlightColor: kSenderMessageColor,
    splashColor: kBackgroundColor,
    cardColor: kSenderMessageColor,
    shadowColor: kShadeColor,
    iconTheme: const IconThemeData(color: kIconColor),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: kBlackShadowBgColor,
    backgroundColor: kDarkBgColor,
    buttonColor: kBackgroundColor,
    cardColor: kBlackShadowBgColor,
    disabledColor: kBlackShadowBgColor,
    focusColor: kFreshPrimaryColor,
    textSelectionColor: kYellowColor,
    canvasColor: kBackgroundColor,
    highlightColor: kBlackShadowBgColor,
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
