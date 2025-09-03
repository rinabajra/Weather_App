import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const inital = Routes.onboarding;

  static final routes = <GetPage>[
    // GetPage(
    //   name: _Paths.onboarding,
    //   page: () => OnboardingView(),
    //   binding: BindingsBuilder.put(() => OnboardingController()),
    // ),
  ];
}
