import 'package:flutter/material.dart';
import 'package:weather_forecast/models/weather_forecast.dart';
import 'package:weather_forecast/providers/weather_provider.dart';
import 'package:weather_forecast/utilities/text_style.dart';
import 'package:provider/provider.dart';

class HistoryWeather extends StatefulWidget {
  const HistoryWeather({super.key});

  @override
  State<HistoryWeather> createState() => _HistoryWeatherState();
}

class _HistoryWeatherState extends State<HistoryWeather> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(builder: (context, value, child) {
      // Load CircularProgressIndicator khi đang load dữ liệu
      if (value.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      // Hiển thị thông báo nếu dữ liệu chưa có dữ liệu
      if (value.yesterdayForcast == null) {
        return Container();
      }

      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: const Text(
                "Yesterday Weather",
                style: Text_Styles_App.h2_black,
              ),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xFF6C757D)),
                child: Column(
                  children: [
                    Text(
                      value.yesterdayForcast!.date,
                      style: Text_Styles_App.h2,
                    ),
                    const SizedBox(height: 8),
                    Image.network(
                      'https:${value.yesterdayForcast!.conditionIcon}',
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Temperature : ${value.yesterdayForcast!.temperature}°C",
                      style: Text_Styles_App.body,
                    ),
                    Text(
                      "Wind : ${value.yesterdayForcast!.wind} m/h",
                      style: Text_Styles_App.body,
                    ),
                    Text(
                      "Humidity : ${value.yesterdayForcast!.humidity}%",
                      style: Text_Styles_App.body,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
