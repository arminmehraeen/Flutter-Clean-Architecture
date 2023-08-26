import 'dart:ui';

class AppLocale {
  static String get translationsPath => 'assets/translations' ;

  static Locale get persian => const Locale("fa", "IR");
  static Locale get english => const Locale("en", "US");

  static Locale get fallbackLocale => english ;

  static List<Locale> locales = [
    persian ,
    english
  ];
}
