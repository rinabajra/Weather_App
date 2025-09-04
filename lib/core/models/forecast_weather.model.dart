import 'city.model.dart';
import 'forecast_item.model.dart';

class ForecastWeather {
  late String cod;
  late int message;
  late int cnt;
  late List<ForecastItem> list;
  late City city;

  ForecastWeather.empty() {
    cod = '';
    message = 0;
    cnt = 0;
    list = [];
    city = City.empty();
  }

  ForecastWeather.fromJson(Map<String, dynamic> json) {
    cod = json['cod'] ?? '';
    message = json['message'] ?? 0;
    cnt = json['cnt'] ?? 0;
    list = mapForecastItemFromList(
      json['list'] != null ? (json['list'] as List<dynamic>) : [],
    );
    city = City.fromJson(json['city']);
  }
}
