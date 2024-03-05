import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/screens/settings_screen.dart';
import 'package:weather/screens/weather_screen.dart';
import 'package:weather/theme/theme_provider.dart';
import 'package:weather/utils/app_routes.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        AppRoutes.home: (context) => const WeatherScreen(),
        AppRoutes.settings: (context) => const SettingsScreen(),
      },
      // home: const WeatherScreen(title: 'Weather'),
    );
  }
}
