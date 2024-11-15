class Weather_Today {
  final double temperature;
  final int humidity;
  final String condition;
  final double wind;
  final String conditionIcon;
  final String conditionText;
  final DateTime localtime;
  final String location;

  Weather_Today({
    required this.temperature,
    required this.humidity,
    required this.condition,
    required this.wind,
    required this.conditionIcon,
    required this.conditionText,
    required this.localtime,
    required this.location,
  });

  factory Weather_Today.fromJson(Map<String, dynamic> json) {
    return Weather_Today(
      temperature: json['current']['temp_c'] ?? 0.0,
      humidity: json['current']['humidity'] ?? 0,
      condition: json['current']['condition']['text'] ?? '',
      wind: json['current']['wind_mph'] ?? 0.0,
      conditionIcon: json['current']['condition']['icon'],
      conditionText: json['current']['condition']['text'],
      localtime: DateTime.parse(json['location']['localtime']),
      location: json['location']['name'] ?? '',
    );
  }
}
