import 'de.dart';
import 'en.dart';
import 'sq.dart';

class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'en': en,
    'de': de,
    'sq': sq,
  };

  static List<String> kTranslationList = ['en🇺🇸', 'de🇩🇪', 'sq🇦🇱'];
}
