import 'package:flutter/material.dart';
import 'package:weather_forecast/utilities/text_style.dart';

class NavberApp extends StatelessWidget {
  const NavberApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: const Color(0xFF5372F0),
      child: const Center(
        child: const Text(
          "Weather Dashboard",
          style: Text_Styles_App.h1,
        ),
      ),
    );
  }
}
