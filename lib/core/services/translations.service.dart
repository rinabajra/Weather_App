import 'dart:ui';

import 'package:get/get.dart';

import '../../utils/constants.dart';

class TranslationsService extends GetxService {
  Map<String, dynamic> tr = {};
  String? locale;

  @override
  void onInit() async {
    await checkTranslations();

    super.onInit();
  }

  Future<void> checkTranslations({String? language}) async {
    locale = kAppStorage.read(kLocale);

    if (tr.isEmpty || (language != null && locale != language)) {
      await getTranslations(language: language);

      if (language != null) await Get.updateLocale(Locale(language));
    }
  }

  Future<void> getTranslations({String? language}) async {
    try {
      kAppStorage.write(kTr, tr);
      kAppStorage.write(
        kLocale,
        language ?? Get.locale?.toString().substring(0, 2),
      );
      locale = language ?? Get.locale?.toString().substring(0, 2);
    } catch (e) {
      kLogger.e('getTranslations:  $e');
    }
  }
}
