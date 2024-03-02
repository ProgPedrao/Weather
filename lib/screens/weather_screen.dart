import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/location_service.dart';
import 'package:weather/services/weather_service.dart';
import 'package:weather/utils/constants.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key, required this.title});

  final String title;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final _weatherService =
      WeatherService(apiKey: Constants.weatherApiKey);
  final _locationService = LocationService();
  Weather? _weather;
  bool _isLoading = true;

  _isLoadingActive() {
    setState(() {
      _isLoading = true;
    });
  }

  _isLoadingDesactive() {
    setState(() {
      _isLoading = false;
    });
  }

  _fetchWeather() async {
    try {
      _isLoadingActive();

      _weather = null;

      final cityName = await _locationService.currentCity();
      final weather = await _weatherService.getWeather(cityName);
      _weather = weather;
    } catch (e) {
      // print(e);
    } finally {
      _isLoadingDesactive();
    }
  }
  
  @override
  void initState() {
    super.initState();

    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Center(
            child: _isLoading
                ? const CircularProgressIndicator()
                : _weather == null
                    ? Text('Não foi possível receber os dados do clima!',
                        style: Theme.of(context).textTheme.bodyLarge)
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('${_weather?.cityName.toUpperCase()}',
                              style:
                                  Theme.of(context).textTheme.headlineSmall),

                          Lottie.asset(_weather?.getWeatherAnimation),
                          const SizedBox(height: 20,),
                          Text(
                            '${_weather?.temperature.round()}°C',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            '${_weather?.mainCondition}',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
          ),
          RefreshIndicator(
            onRefresh: () async => await _fetchWeather(),
            child: const CustomScrollView(
              slivers: <Widget>[
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
