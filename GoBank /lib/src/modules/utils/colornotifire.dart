import 'package:flutter/material.dart';

import 'color.dart';

class ColorNotifire with ChangeNotifier {
  bool isDark = false;
  set setIsDark(value) {
    isDark = value;
    notifyListeners();
  }

  bool get getIsDark => isDark;
  Color get getprimerycolor => isDark ? darkPrimeryColor : primeryColor;
  Color get getbackcolor => isDark ? darkbackColor : lightbackColor;
  Color get getprimerydarkcolor =>
      isDark ? primerydarkColor : primerylightColor;
  Color get getdarkscolor => isDark ? lightColor : darkColor;
  Color get getdarkgreycolor => isDark ? darkgreyColor : greyColor;
  Color get getdarkwhitecolor => isDark ? darkwhiteColor : lightwhiteColor;
  Color get getbluecolor => isDark ? darkblueColor : blueColor;
  Color get gettabcolor => isDark ? darktabColor : tabColor;
  Color get gettabwhitecolor => isDark ? darktabwhiteColor : lighttabwhiteColor;
  Color get getpurplcolor => isDark ? darkpurpulColor : purpulColor;
}
