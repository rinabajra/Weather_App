import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:weather_app/modules/home/controller.dart';
import 'package:weather_app/modules/home/widgets/DailyForecast.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/translations.dart';

import 'TextBox.dart';

class DetailBoxes extends StatelessWidget {
  final HomeController controller;

  const DetailBoxes({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(flex: 2, child: DailyForecast(controller: controller)),
          SizedBox(width: 20),
          if (controller.forecastWeather().list.isNotEmpty) ...[
            Flexible(
              child: Column(
                children: <Widget>[
                  TextBox(
                    text: t('home.feels_like'),
                    text2: getUnitSymbol(
                      controller
                          .forecastWeather()
                          .list[0]
                          .main
                          .feelsLike
                          .round(),
                      controller.savedUnit(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextBox(
                    text: t('home.humidity'),
                    text2:
                        '${controller.forecastWeather().list[0].main.humidity.round()}%',
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
