import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/models/forecast_item.model.dart';
import 'package:weather_app/core/services/translations.service.dart';
import 'package:weather_app/modules/home/controller.dart';
import 'package:weather_app/utils/colors.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/translations.dart';

import '../../../widgets/common/BlurBox.dart';
import '../../../widgets/fonts/Poppins.dart';
import '../../../widgets/global/Resize.dart';

class DailyForecast extends StatelessWidget {
  final HomeController controller;

  const DailyForecast({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return controller.forecastWeather().list.isNotEmpty
        ? BlurBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 13.h),
                Row(
                  children: <Widget>[
                    SizedBox(width: 20),
                    Poppins(
                      t('home.daily'),
                      size: 13,
                      color: AppColors.tertiary,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13.h),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: controller.forecastWeather().list.length,
                    itemBuilder: (context, index) {
                      ForecastItem item = controller
                          .forecastWeather()
                          .list[index];

                      return index == 0 ||
                              (item.dtTxt.contains('15:00:00') &&
                                  !item.dtTxt.contains(
                                    controller
                                        .forecastWeather()
                                        .list[0]
                                        .dtTxt
                                        .split(' ')[0],
                                  ))
                          ? Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 70,
                                  child: Poppins(
                                    index == 0
                                        ? t('home.today')
                                        : DateFormat(
                                            'EEE',
                                            Get.find<TranslationsService>()
                                                    .locale ??
                                                'en',
                                          ).format(DateTime.parse(item.dtTxt)),
                                    size: 14,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Image.network(
                                  "http://openweathermap.org/img/wn/${item.weather[0].icon}@2x.png",
                                  width: 40.h,
                                  height: 40.h,
                                ),
                                SizedBox(width: 15),
                                Poppins(
                                  getUnitSymbol(
                                    item.main.temp.round(),
                                    controller.savedUnit(),
                                  ),
                                  size: 14,
                                ),
                              ],
                            )
                          : SizedBox();
                    },
                  ),
                ),
              ],
            ),
          )
        : SizedBox();
  }
}
