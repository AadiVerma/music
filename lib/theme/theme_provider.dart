import 'package:flutter/material.dart';
import 'package:music/theme/dark_mode.dart';
import 'package:music/theme/light_mode.dart';

class ThemeProvide extends ChangeNotifier {
  // initially light mode
  ThemeData _themeData = lightmode;

  // get theme
  ThemeData get themedata => _themeData;

  // is dark mode
  bool get isDark => _themeData == Darkmode;

// set theme
  set themedata(ThemeData themeData) {
    _themeData = themeData;
// update ui
    notifyListeners();
  }

// toggle theme methods
  void toggle() {
    if (_themeData == lightmode) {
      themedata = Darkmode;
    } else {
      themedata = lightmode;
    }
  }
}
