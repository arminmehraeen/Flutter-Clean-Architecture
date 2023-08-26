import 'package:flutter/material.dart';

import '../../config/app_locale.dart';

class AppHelper {
  static String convertLocaleStateToString(Locale locale) {
    return locale == AppLocale.english ? "English" : "فارسی";
  }

  static String convertThemeStateToString(ThemeMode themeMode) {
    return themeMode == ThemeMode.light ? "روشن" : "تاریک";
  }

  static IconData convertThemeStateToIcon(ThemeMode themeMode) {
    return themeMode == ThemeMode.dark ? Icons.nightlight_round : Icons.sunny;
  }
}
