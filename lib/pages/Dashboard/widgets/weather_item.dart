import 'package:flutter/material.dart';
import 'package:weather_forecast/models/weather_forecast.dart';
import 'package:intl/intl.dart';

import 'package:weather_forecast/utilities/text_style.dart';

Widget weather_item(ForecastWeather weather, int index) {
  return Container(
    margin: const EdgeInsets.only(right: 8),
    width: 160,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5), color: const Color(0xFF6C757D)),
    child: Column(
      children: [
        Text(
          weather.forecastDays[index].date,
          style: Text_Styles_App.h2,
        ),
        const SizedBox(height: 8),
        Image.network(
          'https:${weather.forecastDays[index].conditionIcon}',
          width: 50,
          height: 50,
        ),
        const SizedBox(height: 8),
        Text(
          "Temperature : ${weather.forecastDays[index].temperature}°C",
          style: Text_Styles_App.body,
        ),
        Text(
          "Wind : ${weather.forecastDays[index].wind} m/h",
          style: Text_Styles_App.body,
        ),
        Text(
          "Humidity : ${weather.forecastDays[index].humidity}%",
          style: Text_Styles_App.body,
        ),
      ],
    ),
  );
}
