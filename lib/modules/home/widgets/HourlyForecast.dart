import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/modules/home/controller.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/translations.dart';
import 'package:weather_app/widgets/global/Resize.dart';

import '../../../utils/colors.dart';
import '../../../widgets/common/BlurBox.dart';
import '../../../widgets/fonts/Poppins.dart';

class HourlyForecast extends StatelessWidget {
  const HourlyForecast({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.forecastWeather().list.length < 4
          ? SizedBox(
              height: 300.h,
              child: SpinKitPulsingGrid(
                color: AppColors.main.withValues(alpha: 0.6),
                size: 90.h,
              ),
            )
          : BlurBox(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 13.h),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 20),
                      Poppins(
                        t('home.hourly'),
                        size: 13,
                        color: AppColors.tertiary,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 13.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        for (int i = 0; i < 4; i++)
                          Column(
                            children: <Widget>[
                              Poppins(
                                i == 0
                                    ? t('home.now')
                                    : DateFormat('HH').format(
                                        DateTime.parse(
                                          controller
                                              .forecastWeather()
                                              .list[i]
                                              .dtTxt,
                                        ),
                                      ),
                                size: 14,
                              ),
                              Image.network(
                                "http://openweathermap.org/img/wn/${controller.forecastWeather().list[0].weather[0].icon}@2x.png",
                                width: 40.h,
                                height: 40.h,
                              ),
                              Poppins(
                                getUnitSymbol(
                                  controller
                                      .forecastWeather()
                                      .list[i]
                                      .main
                                      .temp
                                      .round(),
                                  controller.savedUnit(),
                                ),
                                size: 14,
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
