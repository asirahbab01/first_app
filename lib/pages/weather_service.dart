import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import '../models/weather_model.dart';

class WeatherServices {
  static const String apiKey = 'bc899bb241fd84fb688425f80496ab8e'; // Replace with your API key

  // Fetch current weather data
  Future<WeatherData> fetchCurrentWeather(double latitude,double longitude) async {
    Position position = await _determinePosition();

    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&units=metric&appid=$apiKey');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return WeatherData.fromCurrentWeatherJson(data);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  

  // Fetch hourly forecast data
  Future<WeatherData> fetchHourlyForecast({required String cityName}) async {
    Position position = await _determinePosition();

    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?lat=${position.latitude}&lon=${position.longitude}&units=metric&appid=$apiKey');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return WeatherData.fromHourlyForecastJson(data);
    } else {
      throw Exception('Failed to load forecast data');
    }
  }

  // Helper function to get the user's position
  Future<Position> _determinePosition() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permission denied');
      }
    }
    return await Geolocator.getCurrentPosition();
  }

    Future<WeatherData> fetchWeatherByCity(String cityName) async {
    final url = 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return WeatherData.fromCurrentWeatherJson(json);
    } else {
      throw Exception('Failed to load weather data for $cityName');
    }
  }
}

