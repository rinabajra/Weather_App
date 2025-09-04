import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/modules/home/controller.dart';
import 'package:weather_app/modules/home/menu/controller.dart';
import 'package:weather_app/widgets/global/Resize.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/translations.dart' show t;
import '../../../../widgets/fonts/Poppins.dart';
import '../../../../widgets/global/CustomInkWell.dart';

class ChooseLocationRow extends StatelessWidget {
  const ChooseLocationRow({super.key, required this.controller});

  final MenuSettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: <Widget>[
          CustomInkWell(
            onTap: () async {
              controller.showErrorLocation(false);
              await Get.find<HomeController>().getYourLocationWeather()
                  ? Get.back()
                  : controller.showErrorLocation(true);
            },
            child: Row(
              children: <Widget>[
                Icon(Icons.location_pin, color: AppColors.main, size: 25),
                SizedBox(width: 10),
                Poppins.bold(t('home.your_location')),
              ],
            ),
          ),
          if (controller.showErrorLocation())
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10.h, left: 10),
                  child: Poppins.medium(
                    t('home.error_location'),
                    size: 14,
                    color: AppColors.errorRed,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
