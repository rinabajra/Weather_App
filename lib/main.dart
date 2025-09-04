import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weather_app/core/services/network.service.dart';
import 'package:weather_app/widgets/global/Resize.dart';

import 'core/services/translations.service.dart';
import 'routes/app_pages.dart';
import 'utils/config_reader.dart';
import 'utils/constants.dart';
import 'utils/i18n/languages.dart';

Future<void> mainCommon(String env) async {
  WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

  await ConfigReader.initialize(env);
  await GetStorage.init();

  await Get.putAsync(() async => NetworkService());
  await Get.putAsync(() async => TranslationsService());

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    Resize(
      allowtextScaling: false,
      size: const Size(390, 844),
      builder: () => GetMaterialApp(
        getPages: AppPages.routes,
        initialRoute: AppPages.inital,
        debugShowCheckedModeBanner: false,
        fallbackLocale: const Locale('en'),
        supportedLocales: [
          const Locale('en', 'US'),
          const Locale('de', 'DE'),
          const Locale('sq', 'AL'),
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          return supportedLocales.firstWhere(
            (supported) => supported.languageCode == locale?.languageCode,
            orElse: () => supportedLocales.first,
          );
        },
        translationsKeys: AppTranslation.translations,
        locale: WidgetsBinding.instance.platformDispatcher.locale,
        onReady: () async {
          await Get.updateLocale(Locale(kAppStorage.read(kLocale) ?? 'en'));
        },
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
      ),
    ),
  );
}
