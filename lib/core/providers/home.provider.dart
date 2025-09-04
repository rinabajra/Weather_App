import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_app/core/models/forecast_weather.model.dart';
import 'package:weather_app/core/models/network_response.dart';
import 'package:weather_app/core/models/search_city.model.dart';
import 'package:weather_app/utils/errors.dart';

import '../../utils/constants.dart';
import '../services/network.service.dart';

class HomeProvider {
  final NetworkService _networkService = Get.find<NetworkService>();

  Future<List<SearchCity>> getSearchCity(String query) async {
    final NetworkResponse res = await _networkService.callApi(
      API.get,
      '/geo/1.0/direct',
      query: {'q': query, 'limit': '5', 'appid': kApiKey},
    );

    if (!res.ok) throwApiError(res);

    return mapSearchCityFromList(res.data);
  }

  Future<ForecastWeather> getHourlyForecast({
    required double lat,
    required double lon,
    String lang = 'en',
    UNITS units = UNITS.metric,
    bool fetchNewData = false,
  }) async {
    if (!fetchNewData) {
      String? data = await loadResponse();

      if (data != null) {
        ForecastWeather forecastWeather = ForecastWeather.fromJson(
          jsonDecode(data),
        );
        DateTime? time = DateTime.tryParse(forecastWeather.list[0].dtTxt);

        if (time != null && isWithinLastThreeHours(time)) {
          return forecastWeather;
        }
      }
    }

    final NetworkResponse res = await _networkService.callApi(
      API.get,
      '/data/2.5/forecast',
      query: {
        'lat': '$lat',
        'lon': '$lon',
        'lang': lang,
        'units': units.name,
        'appid': kApiKey,
      },
    );

    if (!res.ok) throwApiError(res);

    saveResponse(jsonEncode(res.data));

    return ForecastWeather.fromJson(res.data);
  }

  Future<void> saveResponse(String data) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/response.json');
      await file.writeAsString(data);
    } catch (e) {
      showError('saveResponse', e);
    }
  }

  Future<String?> loadResponse() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/response.json');
      if (await file.exists()) {
        return await file.readAsString();
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
