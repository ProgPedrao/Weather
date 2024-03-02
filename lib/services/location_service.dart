import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<String> currentCity() async {
    final GeolocatorPlatform geolocatorPlatform = GeolocatorPlatform.instance;
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception(
          "Sem permissão para acessar a localicação do dispositivo");
    }

    permission = await geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception(
            "Sem permissão para acessar a localicação do dispositivo");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          "Sem permissão para acessar a localicação do dispositivo");
    }

    final position = await geolocatorPlatform.getCurrentPosition(
        locationSettings:
            const LocationSettings(accuracy: LocationAccuracy.high));

    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);

    String? city = placemarks[0].locality;

    if (city == null || city.isEmpty) {
      throw Exception(
          "Não foi possível pegar o nome da cidade");
    }

    return city;
  }
}