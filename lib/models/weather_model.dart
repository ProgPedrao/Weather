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

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'],
      mainCondition: json['weather'][0]['main'],
      dt: json['dt'],
    );
  }
}
