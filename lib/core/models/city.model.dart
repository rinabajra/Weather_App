import 'forecast_coord.model.dart';

class City {
  late int id;
  late String name;
  late ForecastCoord coord;
  late String country;
  late int population;
  late int timezone;
  late int sunrise;
  late int sunset;

  City.empty() {
    id = 0;
    name = '';
    coord = ForecastCoord.empty();
    country = '';
    population = 0;
    timezone = 0;
    sunrise = 0;
    sunset = 0;
  }

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    coord = ForecastCoord.fromJson(json['coord']);
    country = json['country'] ?? '';
    population = json['population'] ?? 0;
    timezone = json['timezone'] ?? 0;
    sunrise = json['sunrise'] ?? 0;
    sunset = json['sunset'] ?? 0;
  }
}
