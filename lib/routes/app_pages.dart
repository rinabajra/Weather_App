import 'package:get/get.dart';
import 'package:weather_app/modules/home/controller.dart';
import 'package:weather_app/modules/home/home.dart';
import 'package:weather_app/modules/home/menu/controller.dart';
import 'package:weather_app/modules/home/menu/menu.dart';
import 'package:weather_app/modules/onboarding/controller.dart';
import 'package:weather_app/modules/onboarding/onboarding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const inital = Routes.onboarding;

  static final routes = <GetPage>[
    GetPage(
      name: _Paths.onboarding,
      page: () => OnboardingView(),
      binding: BindingsBuilder.put(() => OnboardingController()),
    ),
    GetPage(
      name: _Paths.home,
      page: () => HomeView(),
      binding: BindingsBuilder.put(() => HomeController()),
    ),
    GetPage(
      name: _Paths.menu,
      page: () => MenuView(),
      binding: BindingsBuilder.put(() => MenuSettingsController()),
    ),
  ];
}
