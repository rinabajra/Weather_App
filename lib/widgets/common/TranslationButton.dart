import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/core/services/translations.service.dart';
import 'package:weather_app/utils/i18n/languages.dart';
import 'package:weather_app/widgets/custom/CustomDropdown.dart';
import 'package:weather_app/widgets/global/Resize.dart';

class TranslationButton extends StatelessWidget {
  const TranslationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.h,
      height: 40.h,
      child: Customdropdown(
        fromTranslations: true,
        value: Get.find<TranslationsService>().locale ?? 'en',
        options: AppTranslation.translations.keys.toList(),
        onChanged: (value) async {
          await Get.find<TranslationsService>().checkTranslations(
            language: value,
          );
        },
      ),
    );
  }
}
