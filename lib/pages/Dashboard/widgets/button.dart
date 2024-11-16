import 'package:flutter/material.dart';
import 'package:weather_forecast/providers/weather_provider.dart';
import 'package:weather_forecast/utilities/text_style.dart';
import 'package:provider/provider.dart';

Widget search_button(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Color(0xFF5372F0),
    ),
    width: MediaQuery.of(context).size.width,
    child: TextButton(
        onPressed: () {},
        child: const Text(
          "Search",
          style: Text_Styles_App.body,
        )),
  );
}

Widget current_location_button(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Color(0xFF6C757D),
    ),
    width: MediaQuery.of(context).size.width,
    child: TextButton(
        onPressed: () {},
        child: const Text(
          "Use current location",
          style: Text_Styles_App.body,
        )),
  );
}

Widget load_more(BuildContext context, String location) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Color(0xFF6C757D),
    ),
    width: MediaQuery.of(context).size.width * 0.3,
    child: TextButton(
        onPressed: () {
          Provider.of<WeatherProvider>(context, listen: false)
              .getMoreForecastDay(location);
        },
        child: const Text(
          "Load More",
          style: Text_Styles_App.body,
        )),
  );
}
