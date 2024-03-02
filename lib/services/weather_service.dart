import 'dart:convert';
import 'dart:io';

import 'package:weather/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static get baseUrl => 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey;

  WeatherService({required this.apiKey});

  Future<Weather> getWeather(String cityName) async {
    final response = await http
        .get(Uri.parse('$baseUrl?q=$cityName&appid=$apiKey&units=metric'));

    if (response.statusCode != 200) {
      throw const HttpException(
          "Não foi possível carregar informações do clima");
    }

    Weather weather = Weather.fromJson(jsonDecode(response.body));

    return weather;
  }
}
