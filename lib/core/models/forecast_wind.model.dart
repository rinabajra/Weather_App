class ForecastWind {
  late double speed;
  late int deg;
  late double gust;

  ForecastWind.empty() {
    speed = 0.0;
    deg = 0;
    gust = 0.0;
  }

  ForecastWind.fromJson(Map<String, dynamic> json) {
    speed = double.tryParse(json['speed'].toString()) ?? 0.0;
    deg = json['deg'] ?? 0;
    gust = double.tryParse(json['gust'].toString()) ?? 0.0;
  }
}
