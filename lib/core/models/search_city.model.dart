class SearchCity {
  late String name;
  late double lat;
  late double lon;
  late String country;
  late String? state;

  SearchCity.empty() {
    name = '';
    lat = 0;
    lon = 0;
    country = '';
    state = null;
  }

  SearchCity.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    lat = double.tryParse(json['lat'].toString()) ?? 0;
    lon = double.tryParse(json['lon'].toString()) ?? 0;
    country = json['country'] ?? '';
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'lat': lat,
      'lon': lon,
      'country': country,
      'state': state,
    };
  }
}

List<SearchCity> mapSearchCityFromList(List<dynamic> data) {
  return data.map((e) => SearchCity.fromJson(e)).toList();
}
