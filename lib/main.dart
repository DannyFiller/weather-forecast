import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:weather_forecast/pages/main_page.dart';
import 'package:weather_forecast/providers/weather_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WeatherProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: MainScreen(),
        ),
      ),
    );
  }
}
