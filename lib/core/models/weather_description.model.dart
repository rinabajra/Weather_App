class WeatherDescription {
  late int id;
  late String main;
  late String description;
  late String icon;

  WeatherDescription.empty() {
    id = 0;
    main = '';
    description = '';
    icon = '';
  }

  WeatherDescription.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    main = json['main'] ?? '';
    description = json['description'] ?? '';
    icon = json['icon'] ?? '';
  }
}
