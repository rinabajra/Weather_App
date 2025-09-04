import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/modules/home/controller.dart';
import 'package:weather_app/modules/home/menu/widgets/ChangeUnit.dart';
import 'package:weather_app/modules/home/menu/widgets/ChooseLocationRow.dart';
import 'package:weather_app/modules/home/menu/widgets/ListFromSearch.dart';
import 'package:weather_app/widgets/common/TranslationButton.dart';

import '../../../utils/constants.dart';
import '../../../utils/translations.dart';
import '../../../widgets/common/SearchTextField.dart';
import '../../../widgets/global/Resize.dart';
import '../widgets/WeatherBackground.dart';
import 'controller.dart';

class MenuView extends GetView<MenuSettingsController> {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          WeatherBackground(controller: Get.find<HomeController>()),

          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SafeArea(
                  bottom: false,
                  child: Row(
                    children: <Widget>[
                      BackButton(),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 20, top: 10.h),
                        child: TranslationButton(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20.h, 20, kBottomPadding),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Obx(
                        () => SearchTextfield(
                          hintText: t('form.search'),
                          onTapCross: controller.clearSearch,
                          showClose: controller.hasText.value,
                          searchController: controller.searchController,
                          onChanged: (value) =>
                              controller.onSearchTextChanged(),
                          focusNode: controller.searchFN,
                          suffixIcon: 'search_selected.svg',
                        ),
                      ),
                      Obx(
                        () => !controller.showDropdown()
                            ? SizedBox()
                            : ListFromSearch(controller: controller),
                      ),
                      SizedBox(height: 20.h),
                      ChooseLocationRow(controller: controller),
                      SizedBox(height: 50.h),
                      ChangeUnit(controller: controller),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
