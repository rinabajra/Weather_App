import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:weather_app/widgets/global/Resize.dart';

import 'config_reader.dart';

final Logger kLogger = Logger();
final GetStorage kAppStorage = GetStorage();
const String kAlreadyUsed = 'alreadyUsedApp';
final String kflavor = ConfigReader.getFlavor();
final String kApiUrl = ConfigReader.getApiUrl();
final String kApiKey = ConfigReader.getApiKey();
final String kApiVersion = ConfigReader.getApiVersion();
final double kTopPadding = Get.mediaQuery.padding.top;
final double kBottomPadding =
    Get.mediaQuery.padding.bottom + (Platform.isIOS ? 10.h : 20.h);

//APP INFO
const String kSavedLatLong = 'kSavedLatLong';
const String kSavedUnit = 'kSavedUnit';

//TRANSLATION KEYS
const String kTr = 'tr';
const String kLocale = 'locale';

//PATHS
const String kIconsPath = 'assets/icons';
const String kImagesPath = 'assets/images';

//WEATHER BACKGROUND IMAGES PATHS
const String kSunny = '$kImagesPath/sunny.png';
const String kCloudy = '$kImagesPath/cloudy.png';
const String kRainy = '$kImagesPath/rainy.png';
const String kSnowy = '$kImagesPath/snowy.png';

enum API { get, put, post, delete, patch }

enum UNITS { standard, metric, imperial }

String getUnitSymbol(int temp, UNITS unit) {
  switch (unit) {
    case UNITS.standard:
      return '$temp K';
    case UNITS.metric:
      return '$temp°C';
    case UNITS.imperial:
      return '$temp°F';
  }
}

String getWeatherImage(int? condition) {
  if (condition == null) {
    return '$kImagesPath/sunny.png';
  }
  if (condition < 300) {
    return '$kImagesPath/rainy.png';
  } else if (condition < 400) {
    return '$kImagesPath/rainy.png';
  } else if (condition < 600) {
    return '$kImagesPath/rainy.png';
  } else if (condition < 700) {
    return '$kImagesPath/snow.png';
  } else if (condition < 800) {
    return '$kImagesPath/cloudy.png';
  } else if (condition == 800) {
    return '$kImagesPath/sunny.png';
  } else if (condition <= 804) {
    return '$kImagesPath/cloudy.png';
  } else {
    return '$kImagesPath/sunny.png';
  }
}

bool isWithinLastThreeHours(DateTime date) {
  final now = DateTime.now();
  final threeHoursAgo = now.subtract(Duration(hours: 3));

  return date.isAfter(threeHoursAgo);
}
