import 'package:get/get.dart';
import 'package:weather_app/utils/translations.dart';

import 'colors.dart';

void errorSnackbar({String title = '', String message = '', String? error}) {
  if (title.isEmpty) title = t('error.title');
  if (message.isEmpty) message = t('error.message');

  Get.snackbar(
    '❌ $title',
    message,
    colorText: AppColors.white,
    backgroundColor: AppColors.errorRed.withValues(alpha: 0.6),
  );
}
