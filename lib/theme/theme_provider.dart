import 'package:flutter/material.dart';
import 'package:weather/data/store.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  String translateTheme(BuildContext context, ThemeMode theme) {
    switch (theme) {
      case ThemeMode.light:
        return AppLocalizations.of(context)!.light;
      case ThemeMode.dark:
        return AppLocalizations.of(context)!.dark;
      case ThemeMode.system:
      default:
        return AppLocalizations.of(context)!.system;
    }
  }
  
  String currentTheme(BuildContext context) {
    switch (_themeMode) {
      case ThemeMode.light:
        return AppLocalizations.of(context)!.light;
      case ThemeMode.dark:
        return AppLocalizations.of(context)!.dark;
      case ThemeMode.system:
      default:
        return AppLocalizations.of(context)!.system;
    }
  }

  IconData get themeDataIcon {
  switch (_themeMode) {
      case ThemeMode.light:
        return Icons.wb_sunny_outlined;
      case ThemeMode.dark:
        return Icons.dark_mode_outlined;
      case ThemeMode.system:
      default:
        return Icons.sunny_snowing;
    }
  }

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    Store.saveString('theme', themeMode.index.toString());
    notifyListeners();
  }

  Future<void> toggleTheme(ThemeMode selectedTheme) async {
    themeMode = selectedTheme;
  }

  Future<void> tryThemeData() async {
    final theme = await Store.getString('theme');

    if (theme.isEmpty) return;

    final themeValue = int.tryParse(theme);

    if (themeValue == null) return;

    themeMode = ThemeMode.values.firstWhere((element) => element.index == themeValue);
  }

}