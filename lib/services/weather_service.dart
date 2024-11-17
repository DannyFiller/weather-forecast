import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:weather_forecast/models/weather.dart';
import 'package:weather_forecast/models/weather_forecast.dart';

class WeatherService {
  final String apiKey = '1a46fe4a7b9a4c978c093230241411';
  final String baseUrl = 'https://api.weatherapi.com/v1';
  int defalutNumber = 4;

  Future<Weather_Today?> fetchWeather(String location) async {
    final url = Uri.parse('$baseUrl/current.json?key=$apiKey&q=$location');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return Weather_Today.fromJson(data);
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<ForecastWeather?> fetchWeatherForecast(String location) async {
    final url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$location&days=4');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return ForecastWeather.fromJson(data);
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<ForecastWeather?> fetchMoreWeatherForecast(
      String location, int numberOfDay) async {
    defalutNumber += numberOfDay;
    final url = Uri.parse(
        '$baseUrl/forecast.json?key=$apiKey&q=$location&days=$defalutNumber');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return ForecastWeather.fromJson(data);
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<ForecastDay?> fetchHistoryWeather(String location) async {
    final yesterday = DateTime.now().subtract(Duration(days: 1));
    final formattedDate =
        "${yesterday.year}-${yesterday.month.toString().padLeft(2, '0')}-${yesterday.day.toString().padLeft(2, '0')}";

    final url =
        "$baseUrl/history.json?key=$apiKey&q=$location&dt=$formattedDate";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return ForecastDay.fromJson(data['forecast']['forecastday'][0]);
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
