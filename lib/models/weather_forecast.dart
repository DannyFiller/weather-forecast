class ForecastDay {
  final double temperature;
  final int humidity;
  final String condition;
  final double wind;
  final String conditionIcon;
  final String conditionText;
  final String date;

  ForecastDay({
    required this.temperature,
    required this.humidity,
    required this.condition,
    required this.wind,
    required this.conditionIcon,
    required this.conditionText,
    required this.date,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    return ForecastDay(
      temperature: json['day']['avgtemp_c'],
      humidity: json['day']['avghumidity'],
      condition: json['day']['condition']['code'].toString(),
      wind: json['day']['maxwind_kph'],
      conditionIcon: json['day']['condition']['icon'],
      conditionText: json['day']['condition']['text'],
      date: json['date'],
    );
  }
}

class ForecastWeather {
  final String locationName;
  final List<ForecastDay> forecastDays;

  ForecastWeather({
    required this.locationName,
    required this.forecastDays,
  });

  factory ForecastWeather.fromJson(Map<String, dynamic> json) {
    var forecastJson = json['forecast']['forecastday'] as List;
    List<ForecastDay> forecastDays =
        forecastJson.map((day) => ForecastDay.fromJson(day)).toList();

    return ForecastWeather(
      locationName: json['location']['name'],
      forecastDays: forecastDays,
    );
  }
}
