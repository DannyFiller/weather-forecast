import 'package:flutter/material.dart';
import 'package:weather_forecast/pages/Dashboard/widgets/button.dart';
import 'package:weather_forecast/pages/Dashboard/widgets/current_forcast.dart';
import 'package:weather_forecast/pages/Dashboard/widgets/weather_item.dart';
import 'package:weather_forecast/providers/weather_provider.dart';
import 'package:weather_forecast/utilities/text_style.dart';
import 'package:provider/provider.dart';

class RightPanel extends StatefulWidget {
  const RightPanel({super.key});

  @override
  State<RightPanel> createState() => _RightPanelState();
}

class _RightPanelState extends State<RightPanel> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, weatherProvider, child) {
        final weather = weatherProvider.weather;
        final forecast = weatherProvider.forecast;

        // Load CircularProgressIndicator khi đang load dữ liệu
        if (weatherProvider.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // Hiển thị thông báo nếu dữ liệu chưa có dữ liệu
        if (weather == null) {
          return const Center(
            child: Text(
              "Enter Your Location",
              style: Text_Styles_App.h2_black,
            ),
          );
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              current_forecast(context, weather),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "4-Day ForeCast",
                  style: Text_Styles_App.h2_black,
                ),
              ),
              if (forecast != null)
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.09,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: forecast.forecastDays.length,
                      itemBuilder: (context, index) =>
                          weather_item(forecast, index),
                    ),
                  ),
                )
              else
                const Center(
                  child: Text(
                    "No forecast data available.",
                    style: Text_Styles_App.h2_black,
                  ),
                ),
              Consumer<WeatherProvider>(builder: (context, value, child) {
                return load_more(context, value.location);
              }),
            ],
          ),
        );
      },
    );
  }
}
