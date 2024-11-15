import 'package:flutter/material.dart';
import 'package:weather_forecast/models/weather.dart';
import 'package:weather_forecast/utilities/text_style.dart';
import 'package:intl/intl.dart';

Widget current_forecast(BuildContext context, Weather_Today weather) {
  return LayoutBuilder(
    builder: (context, constraints) {
      double width = constraints.maxWidth;
      double height = width * 0.3;

      double fontSize = width < 600 ? 14 : 20;
      double iconSize = width < 600 ? 40 : 50;

      return Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        height: height,
        width: width * 0.6, // Điều chỉnh chiều rộng theo màn hình
        decoration: BoxDecoration(
            color: const Color(0xFF5372F0),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      "${weather.location} (${DateFormat('yyyy-MM-dd').format(weather.localtime)})",
                      style: Text_Styles_App.h2.copyWith(fontSize: fontSize),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Temperature : ${weather.temperature}°C",
                      style: Text_Styles_App.body.copyWith(fontSize: fontSize),
                    ),
                    Text(
                      "Wind : ${weather.wind} m/h",
                      style: Text_Styles_App.body.copyWith(fontSize: fontSize),
                    ),
                    Text(
                      "Humidity : ${weather.humidity}%",
                      style: Text_Styles_App.body.copyWith(fontSize: fontSize),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'https:${weather.conditionIcon}',
                      width: iconSize,
                      height: iconSize,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "${weather.conditionText}",
                      style: Text_Styles_App.body.copyWith(fontSize: fontSize),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
