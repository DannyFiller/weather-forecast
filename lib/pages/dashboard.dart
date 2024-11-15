// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:weather_forecast/models/weather.dart';
import 'package:weather_forecast/models/weather_forecast.dart';
import 'package:weather_forecast/pages/Dashboard/button.dart';
import 'package:weather_forecast/pages/Dashboard/current_forcast.dart';
import 'package:weather_forecast/pages/Dashboard/weather_item.dart';
import 'package:weather_forecast/services/weather_service.dart';
import 'package:weather_forecast/utilities/text_style.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  final TextEditingController _locationController =
      TextEditingController(text: "Ho Chi Minh City");
  final WeatherService _weatherService = WeatherService();
  Weather_Today? _weather;
  ForecastWeather? _forecast;
  bool _isLoading = false;

  Future<void> _getWeather() async {
    setState(() {
      _isLoading = true;
    });

    Weather_Today? weather =
        await _weatherService.fetchWeather(_locationController.text);
    setState(() {
      _weather = weather;
      _isLoading = false;
    });
  }

  Future<void> _getWeatherForecast() async {
    setState(() {
      _isLoading = true;
    });

    ForecastWeather? forecast =
        await _weatherService.fetchWeatherForecast(_locationController.text);
    setState(() {
      _forecast = forecast;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getWeather();
    _getWeatherForecast();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: const Color(0xFF5372F0),
            child: const Center(
              child: const Text(
                "Weather Dashboard",
                style: Text_Styles_App.h1,
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: const Color(0xFFe3f2fd),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          Text(
                            "Enter a City Name",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          TextField(
                            controller: _locationController,
                            decoration: InputDecoration(
                              filled: true,
                              hintText: "E.g., New York, London, Tokyo",
                              fillColor: Colors.white,
                              border: InputBorder.none,
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xFF5372F0),
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: TextButton(
                                onPressed: () {
                                  _getWeather();
                                  _getWeatherForecast();
                                },
                                child: const Text(
                                  "Search",
                                  style: Text_Styles_App.body,
                                )),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: const [
                              Expanded(child: Divider()),
                              Expanded(
                                  child: Text(
                                "or",
                                textAlign: TextAlign.center,
                              )),
                              Expanded(child: Divider()),
                            ],
                          ),
                          current_location_button(context),
                        ],
                      ),
                    ),
                  ),
                  // Bảng bên phải
                  Expanded(
                    flex: 7,
                    child: Column(
                      children: [
                        current_forecast(context, _weather!),
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "4-Day ForeCast",
                            style: Text_Styles_App.h2_black,
                          ),
                        ),
                        SizedBox(
                            height: 220,
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              itemCount: _forecast?.forecastDays.length,
                              itemBuilder: (context, index) =>
                                  weather_item(_forecast!, index),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
