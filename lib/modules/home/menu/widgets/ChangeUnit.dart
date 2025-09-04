import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/modules/home/menu/controller.dart';
import 'package:weather_app/utils/translations.dart';
import 'package:weather_app/widgets/global/CustomInkWell.dart';
import 'package:weather_app/widgets/global/Resize.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/constants.dart';
import '../../../../widgets/fonts/Poppins.dart';
import '../../controller.dart';

class ChangeUnit extends StatelessWidget {
  const ChangeUnit({super.key, required this.controller});

  final MenuSettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Poppins.bold(t('home.change_units'), size: 18),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            UnitButton(unit: UNITS.imperial),
            UnitButton(unit: UNITS.metric),
            UnitButton(unit: UNITS.standard),
          ],
        ),
      ],
    );
  }
}

class UnitButton extends StatelessWidget {
  final UNITS unit;

  const UnitButton({super.key, required this.unit});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomInkWell(
        onTap: Get.find<HomeController>().savedUnit() == unit
            ? null
            : () => Get.find<MenuSettingsController>().changeUnit(unit),
        child: Poppins.black(
          unit.name.toUpperCase(),
          color: Get.find<HomeController>().savedUnit() == unit
              ? AppColors.errorRed
              : AppColors.mainText,
        ),
      ),
    );
  }
}
