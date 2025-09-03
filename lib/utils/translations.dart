import 'package:get/get.dart';

import '../core/services/translations.service.dart';

String t(String key) => Get.find<TranslationsService>().tr[key] ?? key.tr;

String tParams(String key, Map<String, String> params) {
  String t = Get.find<TranslationsService>().tr[key] ?? key.tr;

  params.forEach((k, v) => t = t.replaceAll('@$k', v));

  return t;
}
