import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:weather_app/routes/app_pages.dart';
import 'package:weather_app/utils/constants.dart';

class OnboardingController extends GetxController {
  Rx<double> page = 0.0.obs;
  Rx<int> roundedPage = 1.obs;
  PageController pageController = PageController();
  ValueNotifier<double> scrollNotifier = ValueNotifier<double>(0);
  final bool alreadyUsedApp = kAppStorage.read(kAlreadyUsed) ?? false;

  @override
  void onInit() {
    FlutterNativeSplash.remove();

    pageController.addListener(() {
      page(pageController.page!);

      roundedPage(
        (page() > (page().floor() + 0.5) ? page().ceil() : page().floor()) + 1,
      );

      scrollNotifier.value = pageController.page!;
    });

    super.onInit();
  }

  @override
  void onReady() {
    if (alreadyUsedApp == true) {
      Get.offAndToNamed(Routes.home);
    }
    super.onReady();
  }

  @override
  void dispose() {
    scrollNotifier.dispose();
    pageController.dispose();
    super.dispose();
  }
}
