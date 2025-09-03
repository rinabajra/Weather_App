import 'package:weather_app/main.dart';

import 'utils/config_reader.dart';

Future<void> main() async {
  await mainCommon(Environment.dev);
}
