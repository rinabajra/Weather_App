part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const onboarding = _Paths.onboarding;
  static const home = _Paths.home;
  static const menu = _Paths.menu;
}

abstract class _Paths {
  static const onboarding = '/onboarding';
  static const home = '/home';
  static const menu = '/menu';
}
