import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:weather/models/locale_description_model.dart';

class L10n {
  
  static final allWithDescription = [
    LocaleDescription(country: "Brasil", language: "Português", locale: const Locale("pt", "BR"), flag: FlagsCode.BR),
    LocaleDescription(country: "EUA", language: "English", locale: const Locale("en"), flag: FlagsCode.US),
  ];

  // static final all = [
  //   const Locale("pt", "BR"),
  //   const Locale("en"),
  // ];

  static final List<Locale> locales = allWithDescription.map((desc) => desc.locale).toList();

}
