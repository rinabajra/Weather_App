import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/modules/home/controller.dart';
import 'package:weather_app/modules/home/widgets/DetailBoxes.dart';
import 'package:weather_app/modules/home/widgets/HeaderInfo.dart';
import 'package:weather_app/modules/home/widgets/HourlyForecast.dart';
import 'package:weather_app/modules/home/widgets/WeatherBackground.dart';
import 'package:weather_app/utils/colors.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/widgets/global/Resize.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          WeatherBackground(controller: controller),
          SafeArea(
            bottom: false,
            child: RefreshIndicator(
              color: AppColors.main,
              onRefresh: () async =>
                  await controller.initAsync(fetchNewData: true),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, kBottomPadding),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      HeaderInfo(controller: controller),
                      HourlyForecast(controller: controller),
                      SizedBox(height: 20.h),
                      DetailBoxes(controller: controller),
                      SizedBox(height: 200),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
