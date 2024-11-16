import 'package:flutter/material.dart';
import 'package:weather_forecast/pages/Dashboard/widgets/button.dart';
import 'package:weather_forecast/providers/weather_provider.dart';
import 'package:weather_forecast/utilities/text_style.dart';
import 'package:provider/provider.dart';

class LeftPanel extends StatefulWidget {
  const LeftPanel({super.key});

  @override
  State<LeftPanel> createState() => _LeftPanelState();
}

class _LeftPanelState extends State<LeftPanel> {
  final TextEditingController _locationController = TextEditingController();

  Future<void> _getWeather() async {
    Provider.of<WeatherProvider>(context, listen: false)
        .getCurrentWeather(_locationController.text);
  }

  Future<void> _getWeatherForecast() async {
    Provider.of<WeatherProvider>(context, listen: false)
        .getForecastAtLocation(_locationController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        children: [
          const Text(
            "Enter a City Name",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: _locationController,
            decoration: const InputDecoration(
              filled: true,
              hintText: "E.g., New York, London, Tokyo",
              fillColor: Colors.white,
              border: InputBorder.none,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color(0xFF5372F0),
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
          const SizedBox(height: 8),
          const Row(
            children: [
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
    );
  }
}
