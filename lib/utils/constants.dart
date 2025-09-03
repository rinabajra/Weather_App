import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:weather_app/widgets/global/Resize.dart';

import 'config_reader.dart';

final Logger kLogger = Logger();
final GetStorage kAppStorage = GetStorage();
final String kflavor = ConfigReader.getFlavor();
final String kApiUrl = ConfigReader.getApiUrl();
final String kApiVersion = ConfigReader.getApiVersion();
final double kTopPadding = Get.mediaQuery.padding.top;
final double kBottomPadding =
    Get.mediaQuery.padding.bottom + (Platform.isIOS ? 10.h : 20.h);

const String kTr = 'tr';
const String kLocale = 'locale';
const String kTrLastModifiedDate = 'translations_last_modified_date';

//PATHS
const String kIconsPath = 'assets/icons';
const String kImagesPath = 'assets/images';

enum API { get, put, post, delete, patch }
