import 'package:flutter/material.dart';
import 'package:weather_forecast/pages/Dashboard/widgets/button.dart';
import 'package:weather_forecast/pages/Dashboard/widgets/history.dart';
import 'package:weather_forecast/providers/weather_provider.dart';
import 'package:weather_forecast/services/authService.dart';
import 'package:weather_forecast/utilities/text_style.dart';
import 'package:provider/provider.dart';

class LeftPanel extends StatefulWidget {
  const LeftPanel({super.key});

  @override
  State<LeftPanel> createState() => _LeftPanelState();
}

class _LeftPanelState extends State<LeftPanel> {
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  Future<void> _getWeather() async {
    Provider.of<WeatherProvider>(context, listen: false)
        .getCurrentWeather(_locationController.text);
  }

  Future<void> _getWeatherForecast() async {
    Provider.of<WeatherProvider>(context, listen: false)
        .getForecastAtLocation(_locationController.text);
  }

  Future<void> _getYesterdayWeather() async {
    Provider.of<WeatherProvider>(context, listen: false)
        .getHistoryForcast(_locationController.text);
  }

  Future<void> _sendMail() async {
    Authservice authservice = Authservice();
    authservice.sendSignInLink(_emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        children: [
          const Text(
            "Enter a City Name",
            style: Text_Styles_App.bodyBold,
          ),
          TextField(
            controller: _locationController,
            decoration: const InputDecoration(
              filled: true,
              hintText: "E.g., New York, London, Tokyo",
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
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
                  _getYesterdayWeather();
                },
                child: const Text(
                  "Search",
                  style: Text_Styles_App.body,
                )),
          ),
          Divider(),
          Text(
            "Subscribe To Receice Daily Mail",
            style: Text_Styles_App.bodyBold,
          ),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              filled: true,
              hintText: "Email",
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
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
                  _sendMail();
                },
                child: const Text(
                  "Subscribe",
                  style: Text_Styles_App.body,
                )),
          ),
          Expanded(child: HistoryWeather()),
        ],
      ),
    );
  }
}
