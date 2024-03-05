import 'package:flutter/material.dart';
import 'package:weather/data/store.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = ThemeData.light();

  ThemeData get themeData => _themeData;

  IconData get themeDataIcon => _themeData == ThemeData.dark() ? Icons.dark_mode_outlined : Icons.wb_sunny_outlined;
  
  String get themeDataName => _themeData == ThemeData.dark() ? 'Dark' : 'Light';

  set themeData(ThemeData themeData){
    _themeData = themeData;
    Store.saveString('theme', themeDataName);
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    if (_themeData == ThemeData.light()) {
      themeData = ThemeData.dark();
    } else {
      themeData = ThemeData.light();
    }
  }

  Future<void> tryThemeData() async {
    
    final theme = await Store.getString('theme');

    if (theme.isEmpty) return;

    themeData = theme.toLowerCase() == 'dark' ? ThemeData.dark() : ThemeData.light();
    
  }

}