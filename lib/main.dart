import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:weather/l10n/l10n.dart';
import 'package:weather/l10n/locale_provider.dart';
import 'package:weather/screens/language_list_screen.dart';
import 'package:weather/screens/settings_screen.dart';
import 'package:weather/screens/weather_screen.dart';
import 'package:weather/theme/theme_provider.dart';
import 'package:weather/utils/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider()..tryThemeData(),
        ),
        ChangeNotifierProvider(
          create: (context) => LocaleProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: Provider.of<ThemeProvider>(context).themeData,
      locale: Provider.of<LocaleProvider>(context).locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: L10n.locales,
      routes: {
        AppRoutes.home: (context) => const WeatherScreen(),
        AppRoutes.settings: (context) => const SettingsScreen(),
        AppRoutes.languages: (context) => const LanguageListScreen(),
      },
      // home: const WeatherScreen(title: 'Weather'),
    );
  }
}
