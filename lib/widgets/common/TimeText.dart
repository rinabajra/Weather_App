import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/utils/colors.dart';
import 'package:weather_app/widgets/fonts/Poppins.dart';

import '../../core/services/translations.service.dart';

class TimeText extends StatelessWidget {
  final Stream<DateTime> timeStream;
  final DateFormat timeFormat;

  const TimeText({
    super.key,
    required this.timeStream,
    required this.timeFormat,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DateTime>(
      stream: timeStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Poppins.bold("--:--", size: 40, color: AppColors.tertiary);
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Poppins.bold(
              timeFormat.format(snapshot.data!),
              size: 40,
              shadow: true,
              color: AppColors.tertiary,
            ),
            Poppins(
              DateFormat(
                'EEEE | MMM d',
                Get.find<TranslationsService>().locale ?? 'en',
              ).format(snapshot.data!),
              size: 18,
              color: AppColors.tertiary,
            ),
          ],
        );
      },
    );
  }
}
