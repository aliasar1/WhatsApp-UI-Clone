import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'constants.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    indicatorColor: kBackgroundColor,
    backgroundColor: kBackgroundColor,
    canvasColor: kDarkBgColor,
    hintColor: kBackgroundColor,
    accentColor: kBackgroundColor,
    disabledColor: kYellowColor,
    primaryColorDark: kDarkGreyColor,
    focusColor: kReceiverMessageColor,
    buttonColor: kDarkGreyColor,
    scaffoldBackgroundColor: Colors.white,
    bottomAppBarColor: kPrimaryColor,
    appBarTheme: lightAppBarTheme,
    highlightColor: kSenderMessageColor,
    primaryColorLight: kPrimaryColor,
    splashColor: kBackgroundColor,
    cardColor: kSenderMessageColor,
    hoverColor: kBackgroundColor,
    shadowColor: kShadeColor,
    iconTheme: const IconThemeData(color: kIconColor),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: kBlackShadowBgColor,
    accentColor: kBlackShadowBgColor,
    hintColor: kLightGreyColor,
    backgroundColor: kDarkBgColor,
    buttonColor: kBackgroundColor,
    cardColor: kBlackShadowBgColor,
    bottomAppBarColor: kBlackShadowBgColor,
    disabledColor: kBlackShadowBgColor,
    primaryColorLight: kFreshPrimaryColor,
    hoverColor: kLightGreyColor,
    focusColor: kFreshPrimaryColor,
    primaryColorDark: kYellowColor,
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
