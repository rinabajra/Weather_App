import 'package:weather_app/core/models/forecast_wind.model.dart';

import 'forecast_main.model.dart';
import 'weather_description.model.dart';

class ForecastItem {
  late int dt;
  late ForecastMain main;
  late List<WeatherDescription> weather;
  late ForecastWind wind;
  late int visibility;
  late double pop;
  late String dtTxt;

  ForecastItem.empty() {
    dt = 0;
    main = ForecastMain.empty();
    weather = [];
    wind = ForecastWind.empty();
    visibility = 0;
    pop = 0.0;
    dtTxt = '';
  }

  ForecastItem.fromJson(Map<String, dynamic> json) {
    dt = json['dt'] ?? 0;
    main = ForecastMain.fromJson(json['main']);
    weather = (json['weather'] as List<dynamic>)
        .map((e) => WeatherDescription.fromJson(e))
        .toList();
    wind = ForecastWind.fromJson(json['wind']);
    visibility = json['visibility'] ?? 0;
    pop = double.tryParse(json['pop'].toString()) ?? 0.0;
    dtTxt = json['dt_txt'] ?? '';
  }
}

List<ForecastItem> mapForecastItemFromList(List<dynamic> data) {
  return data.map((e) => ForecastItem.fromJson(e)).toList();
}
