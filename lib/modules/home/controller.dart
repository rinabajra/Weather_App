import 'dart:async';

import 'package:geolocator/geolocator.dart' as gl;
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart' as ph;
import 'package:weather_app/core/providers/home.provider.dart';
import 'package:weather_app/core/services/translations.service.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/errors.dart';

import '../../core/models/forecast_weather.model.dart';

class HomeController extends GetxController {
  int locationPermission = 0;
  RxBool loading = false.obs;
  RxDouble userLatPosition = 0.0.obs;
  RxDouble userLonPosition = 0.0.obs;
  Stream<DateTime> timeStream = Stream.empty();
  String savedLatLong = (kAppStorage.read(kSavedLatLong) ?? '');
  Rx<ForecastWeather> forecastWeather = ForecastWeather.empty().obs;
  final Rx<UNITS> savedUnit = UNITS.metric.obs;

  @override
  void onInit() {
    if (kAppStorage.read(kSavedUnit) != null) {
      savedUnit(
        kAppStorage.read(kSavedUnit) == 'standard'
            ? UNITS.standard
            : kAppStorage.read(kSavedUnit) == 'imperial'
            ? UNITS.imperial
            : UNITS.metric,
      );
    }

    initAsync();

    timeStream = Stream.periodic(const Duration(seconds: 1), (_) {
      return DateTime.now();
    });

    super.onInit();
  }

  Future<void> initAsync() async {
    try {
      if (savedLatLong.isNotEmpty) {
        List<String> latLong = savedLatLong.split(',');
        await getForecast(
          double.parse(latLong[0]),
          double.parse(latLong[1]),
          Get.find<TranslationsService>().locale ?? 'en',
          savedUnit(),
        );
      } else {
        locationPermission = await getLocationPermission();
        if (userLatPosition() == 0.0 && userLonPosition() == 0.0) {
          await getForecast(
            42.6629,
            21.1655,
            Get.find<TranslationsService>().locale ?? 'en',
            savedUnit(),
          );
        } else {
          await getForecast(
            userLatPosition(),
            userLonPosition(),
            Get.find<TranslationsService>().locale ?? 'en',
            savedUnit(),
          );
        }
      }
    } catch (e) {
      showError('_initAsync(): ', e);
    }
  }

  Future<int> getLocationPermission() async {
    try {
      late bool serviceEnabled;
      late PermissionStatus permissionGranted;
      Location location = Location();
      permissionGranted = await location.hasPermission();

      if (permissionGranted == PermissionStatus.deniedForever) {
        await ph.openAppSettings();
      } else if (permissionGranted != PermissionStatus.granted) {
        permissionGranted = await location.requestPermission();
      }

      serviceEnabled = await location.serviceEnabled();

      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
      }

      if (permissionGranted == PermissionStatus.granted) {
        gl.Position userPosition = await gl.Geolocator.getCurrentPosition(
          locationSettings: gl.LocationSettings(
            accuracy: gl.LocationAccuracy.best,
            distanceFilter: 1,
          ),
        );

        userLatPosition(userPosition.latitude);
        userLonPosition(userPosition.longitude);
        return 0;
      }

      return permissionGranted == PermissionStatus.granted ? 1 : -1;
    } catch (e) {
      showError('getLocationPermission: ', e);

      return -1;
    }
  }

  Future<void> getForecast(
    double lat,
    double lon,
    String lang,
    UNITS unit, {
    bool fetchNewData = false,
  }) async {
    loading(true);
    try {
      forecastWeather(
        await HomeProvider().getHourlyForecast(
          lat: lat,
          lon: lon,
          lang: lang,
          units: unit,
          fetchNewData: fetchNewData,
        ),
      );
    } catch (e) {
      showError('getForecast :', e);
    } finally {
      loading(false);
    }
  }

  Future<bool> getYourLocationWeather() async {
    locationPermission = await getLocationPermission();

    if (userLatPosition() == 0.0 && userLonPosition() == 0.0) {
      return false;
    }

    getForecast(
      userLatPosition(),
      userLonPosition(),
      Get.find<TranslationsService>().locale ?? 'en',
      savedUnit(),
      fetchNewData: true,
    );

    kAppStorage.write(
      kSavedLatLong,
      '${userLatPosition()},${userLonPosition()}',
    );
    Get.find<HomeController>().savedLatLong =
        '${userLatPosition()},${userLonPosition()}';

    return true;
  }
}
