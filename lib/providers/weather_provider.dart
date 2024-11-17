import 'package:flutter/material.dart';
import 'package:weather_forecast/models/weather.dart';
import 'package:weather_forecast/models/weather_forecast.dart';
import 'package:weather_forecast/services/weather_service.dart';

class WeatherProvider with ChangeNotifier {
  final WeatherService _weatherService = WeatherService();
  Weather_Today? _weather;
  ForecastWeather? _forecast;
  ForecastDay? _yesterdayForecast;
  bool _isLoading = false;
  String _location = '';

  Weather_Today? get weather => _weather;
  ForecastWeather? get forecast => _forecast;
  ForecastDay? get yesterdayForcast => _yesterdayForecast;
  bool get isLoading => _isLoading;
  String get location => _location;

  getCurrentWeather(String location) async {
    Weather_Today? weather = await _weatherService.fetchWeather(location);
    _weather = weather;
    _isLoading = false;
    _location = location;
    notifyListeners();
  }

  getForecastAtLocation(String location) async {
    ForecastWeather? forecast =
        await _weatherService.fetchWeatherForecast(location);
    _forecast = forecast;
    _isLoading = false;
    _location = location;
    notifyListeners();
  }

  getMoreForecastDay(String location) async {
    ForecastWeather? forecast =
        await _weatherService.fetchMoreWeatherForecast(location, 4);
    _forecast = forecast;
    _isLoading = false;
    notifyListeners();
  }

  getHistoryForcast(String location) async {
    ForecastDay? yesterdayForecast =
        await _weatherService.fetchHistoryWeather(location);
    _yesterdayForecast = yesterdayForecast;
    _isLoading = false;
    notifyListeners();
  }
}
