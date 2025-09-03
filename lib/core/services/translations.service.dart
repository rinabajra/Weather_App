import 'dart:ui';

import 'package:get/get.dart';

import '../../utils/constants.dart';

class TranslationsService extends GetxService {
  Map<String, dynamic> tr = {};
  String? locale;
  late DateTime lastModifiedDate;

  @override
  void onInit() async {
    await checkTranslations();

    super.onInit();
  }

  Future<void> checkTranslations({String? language}) async {
    final DateTime? localLastModifiedDate = DateTime.tryParse(
      kAppStorage.read(kTrLastModifiedDate) ?? '',
    );

    tr = kAppStorage.read(kTr) ?? {};
    locale = kAppStorage.read(kLocale);
    lastModifiedDate = DateTime.now();

    if (tr.isEmpty ||
        (language != null && locale != language) ||
        lastModifiedDate.isAfter(localLastModifiedDate!)) {
      await getTranslations(language: language);

      if (language != null) await Get.updateLocale(Locale(language));
    }
  }

  Future<void> getTranslations({String? language}) async {
    try {
      kAppStorage.write(kTr, tr);
      kAppStorage.write(kTrLastModifiedDate, lastModifiedDate.toString());
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
