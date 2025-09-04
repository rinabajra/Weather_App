class ForecastCoord {
  late double lat;
  late double lon;

  ForecastCoord.empty() {
    lat = 0.0;
    lon = 0.0;
  }

  ForecastCoord.fromJson(Map<String, dynamic> json) {
    lat = double.tryParse(json['lat'].toString()) ?? 0.0;
    lon = double.tryParse(json['lon'].toString()) ?? 0.0;
  }
}
