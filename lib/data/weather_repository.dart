import 'dart:math';

import 'model/weather.dart';

abstract class WeatherRepository {
  /// Throws [NetworkException].
  Future<Weather> fetchWeather(String cityName);
}

class FakeWeatherRepository implements WeatherRepository {
  @override
  Future<Weather> fetchWeather(String cityName) {
    // Simulate network delay
    return Future.delayed(
      Duration(seconds: 1),
      () {
        final random = Random();
        final randomError = random.nextInt(10);
        print("random error: ${randomError}");
        // Simulate some network exception
        if (randomError <= 8 ? false : true) {
          throw NetworkException();
        }

        // Return "fetched" weather
        return Weather(
          cityName: cityName,
          // Temperature between 20 and 35.99
          temperatureCelsius: 20 + random.nextInt(15) + random.nextDouble(),
        );
      },
    );
  }
}

class NetworkException implements Exception {}
