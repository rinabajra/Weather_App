class ForecastMain {
  late double temp;
  late double feelsLike;
  late double tempMin;
  late double tempMax;
  late int pressure;
  late int seaLevel;
  late int grndLevel;
  late int humidity;
  late double tempKf;

  ForecastMain.empty() {
    temp = 0.0;
    feelsLike = 0.0;
    tempMin = 0.0;
    tempMax = 0.0;
    pressure = 0;
    seaLevel = 0;
    grndLevel = 0;
    humidity = 0;
    tempKf = 0.0;
  }
  ForecastMain.fromJson(Map<String, dynamic> json) {
    temp = double.tryParse(json['temp'].toString()) ?? 0.0;
    feelsLike = double.tryParse(json['feels_like'].toString()) ?? 0.0;
    tempMin = double.tryParse(json['temp_min'].toString()) ?? 0.0;
    tempMax = double.tryParse(json['temp_max'].toString()) ?? 0.0;
    pressure = json['pressure'] ?? 0;
    seaLevel = json['sea_level'] ?? 0;
    grndLevel = json['grnd_level'] ?? 0;
    humidity = json['humidity'] ?? 0;
    tempKf = double.tryParse(json['temp_kf'].toString()) ?? 0.0;
  }
}
