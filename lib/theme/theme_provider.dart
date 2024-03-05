import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = ThemeData.light();

  ThemeData get themeData => _themeData;

  IconData get themeDataIcon => _themeData == ThemeData.dark() ? Icons.dark_mode_outlined : Icons.wb_sunny_outlined;

  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme(){
    if (_themeData == ThemeData.light()) {
      themeData = ThemeData.dark();
    } else {
      themeData = ThemeData.light();
    }
  }

}