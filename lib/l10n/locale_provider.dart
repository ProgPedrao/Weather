import 'package:flutter/material.dart';
import 'package:weather/l10n/l10n.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale = L10n.locales.first;

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.locales.contains(locale)) return;

    _locale = locale;
    notifyListeners();
  }
  
  void clearLocale() {
    _locale = L10n.locales.first;
    notifyListeners();
  }

  
}
