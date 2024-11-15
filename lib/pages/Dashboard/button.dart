import 'package:flutter/material.dart';
import 'package:weather_forecast/utilities/text_style.dart';

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
