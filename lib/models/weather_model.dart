import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Weather {
  final String cityName;
  final double temperature;
  final String mainCondition;
  final int dt;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
    required this.dt,
  });

  get humanTimeToUnix {
    return DateTime.fromMillisecondsSinceEpoch(dt * 1000);
  }

  get getWeatherAnimation {
    DateTime dateTime = humanTimeToUnix;

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/animations/cloud.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return dateTime.hour > 17 || dateTime.hour < 5 ? 'assets/animations/moon_rain.json' : 'assets/animations/sun_rain.json';
      case 'thunderstorm':
        return 'assets/animations/storm.json';
      case 'clear':
      return dateTime.hour > 17 || dateTime.hour < 5 ? 'assets/animations/moon.json' : 'assets/animations/sun.json';
      default:
        return 'assets/animations/cloud.json';
    }
  }
  
  String getWeatherTranslation(BuildContext context) {
    switch (mainCondition.toLowerCase()) {
      case 'clouds':
        return AppLocalizations.of(context)!.clouds;
      case 'mist':
        return AppLocalizations.of(context)!.mist;
      case 'smoke':
        return AppLocalizations.of(context)!.smoke;
      case 'haze':
        return AppLocalizations.of(context)!.haze;
      case 'dust':
        return AppLocalizations.of(context)!.dust;
      case 'fog':
        return AppLocalizations.of(context)!.fog;
      case 'rain':
        return AppLocalizations.of(context)!.rain;
      case 'drizzle':
        return AppLocalizations.of(context)!.drizzle;
      case 'shower rain':
        return AppLocalizations.of(context)!.shower_rain;
      case 'thunderstorm':
        return AppLocalizations.of(context)!.thunderstorm;
      case 'clear':
        return AppLocalizations.of(context)!.clear;
      default:
        return AppLocalizations.of(context)!.clouds;
    }
  }

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'],
      mainCondition: json['weather'][0]['main'],
      dt: json['dt'],
    );
  }
}
