import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/modules/onboarding/controller.dart';
import 'package:weather_app/modules/onboarding/widgets/ScrollablePart.dart';
import 'package:weather_app/routes/app_pages.dart';
import 'package:weather_app/utils/colors.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/translations.dart';
import 'package:weather_app/widgets/common/TranslationButton.dart';
import 'package:weather_app/widgets/custom/CustomButton.dart';
import 'package:weather_app/widgets/global/AnimatedDots.dart';
import 'package:weather_app/widgets/global/Resize.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Obx(
        () => Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  ScrollablePart(controller: controller),
                  Positioned(
                    top: (Get.height / 2) - 15.h,
                    child: Container(
                      height: 30.h,
                      width: Get.width,
                      decoration: const BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: SafeArea(
                      child: Padding(
                        padding: EdgeInsets.only(top: 5.h, left: 15, right: 25),
                        child: Row(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                '$kImagesPath/splash_image.png',
                                height: 60.h,
                              ),
                            ),
                            Spacer(),
                            TranslationButton(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedDots(
              page: controller.page(),
              color: AppColors.main,
              pageController: controller.pageController,
            ),
            SizedBox(height: 21.h),
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, kBottomPadding),
                child: CustomButton(
                  text: t('onboarding.button'),
                  onPressed: () {
                    kAppStorage.write(kAlreadyUsed, true);
                    Get.offAllNamed(Routes.home);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
