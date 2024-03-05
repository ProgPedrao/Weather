import 'package:flutter/material.dart';
import 'package:weather/data/store.dart';
import 'package:weather/l10n/l10n.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale = L10n.locales.first;

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.locales.contains(locale)) return;

    Store.saveString('language', locale.languageCode);

    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = L10n.locales.first;
    notifyListeners();
  }

  Future<void> tryLocale() async {
    final localeLanguageCode = await Store.getString("language");

    if (localeLanguageCode.isEmpty) return;

    final locale = L10n.locales.firstWhere(
      (element) => element.languageCode == localeLanguageCode,
      orElse: () => L10n.locales.first,
    );

    setLocale(locale);
  }
}
