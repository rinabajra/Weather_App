import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/modules/onboarding/controller.dart';
import 'package:weather_app/utils/colors.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/translations.dart';
import 'package:weather_app/widgets/common/TitleCustom.dart';
import 'package:weather_app/widgets/fonts/Poppins.dart';
import 'package:weather_app/widgets/global/Resize.dart';

class ScrollablePart extends StatelessWidget {
  final OnboardingController controller;

  const ScrollablePart({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoGlowScrollBehavior(),
      child: PageView(
        controller: controller.pageController,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          for (int i = 1; i <= 2; i++)
            Stack(
              children: <Widget>[
                SizedBox(
                  width: Get.width,
                  height: (Get.height / 2),
                  child: Image.asset(
                    '$kImagesPath/onboarding$i.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  top: (Get.height / 2) - 15.h,
                  child: Container(
                    clipBehavior: Clip.none,
                    decoration: const BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 37, 25, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                TitleCustom(
                                  title: t('onboarding.title$i'),
                                  keyword: t('onboarding.title_keyword$i'),
                                ),
                                SizedBox(height: 16.h),
                                Poppins(
                                  t('onboarding.description$i'),
                                  size: 16,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(height: 1.8),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class NoGlowScrollBehavior extends ScrollBehavior {
  Widget buildViewportChrome(ctx, child, axisDirection) => child;
}
