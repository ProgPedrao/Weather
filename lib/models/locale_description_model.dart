import 'package:flag/flag.dart';
import 'package:flutter/material.dart';

class LocaleDescription {
  final String language;
  final String country;
  final Locale locale;
  final FlagsCode flag;

  LocaleDescription({required this.language, required this.country, required this.locale, required this.flag});
}