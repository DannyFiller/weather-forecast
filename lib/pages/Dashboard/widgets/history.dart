// import 'package:flutter/material.dart';

// class HistoryWeather extends StatefulWidget {
//   const HistoryWeather({super.key});

//   @override
//   State<HistoryWeather> createState() => _HistoryWeatherState();
// }

// class _HistoryWeatherState extends State<HistoryWeather> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.width * 0.09,
//       child: GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 4,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//         ),
//         itemCount: forecast.forecastDays.length,
//         itemBuilder: (context, index) => weather_item(forecast, index),
//       ),
//     );
//   }
// }
