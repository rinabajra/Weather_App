import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/modules/home/controller.dart';
import 'package:weather_app/utils/colors.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/widgets/common/TimeText.dart';
import 'package:weather_app/widgets/fonts/Poppins.dart';
import 'package:weather_app/widgets/global/Resize.dart';

import '../../../routes/app_pages.dart';

class HeaderInfo extends StatelessWidget {
  const HeaderInfo({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Spacer(),
              IconButton(
                icon: Icon(Icons.menu_rounded, size: 30),
                onPressed: () => Get.toNamed(Routes.menu),
              ),
            ],
          ),
          TimeText(
            timeStream: controller.timeStream,
            timeFormat: DateFormat('HH:mm'),
          ),
          SizedBox(height: 10.h),
          Poppins(
            controller.forecastWeather().city.name,
            size: 26,
            shadow: true,
          ),
          SizedBox(height: 5.h),
          if (controller.forecastWeather().list.isNotEmpty) ...[
            Poppins(
              getUnitSymbol(
                controller.forecastWeather().list[0].main.temp.round(),
                controller.savedUnit(),
              ),
              size: 50.h,
              shadow: true,
            ),
            Poppins(
              controller.forecastWeather().list[0].weather[0].description,
              color: AppColors.tertiary,
            ),
          ],

          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
