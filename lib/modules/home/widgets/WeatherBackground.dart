import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:weather_app/modules/home/controller.dart';
import 'package:weather_app/utils/constants.dart';

class WeatherBackground extends StatelessWidget {
  const WeatherBackground({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedOpacity(
        opacity: controller.forecastWeather().list.isNotEmpty ? 0.5 : 0,
        duration: const Duration(milliseconds: 500),
        child: controller.forecastWeather().list.isNotEmpty
            ? Image.asset(
                getWeatherImage(
                  controller.forecastWeather().list[0].weather[0].id,
                ),
                fit: BoxFit.cover,
              )
            : SizedBox(),
      ),
    );
  }
}
