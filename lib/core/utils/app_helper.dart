import 'package:flutter/material.dart';

import '../../config/app_locale.dart';

String convertLocaleStateToString(Locale locale) =>
    locale == AppLocale.english ? "English" : "فارسی";

String convertThemeStateToString(ThemeMode themeMode) =>
    themeMode == ThemeMode.light ? "روشن" : "تاریک";

IconData convertThemeStateToIcon(ThemeMode themeMode) =>
    themeMode == ThemeMode.dark ? Icons.nightlight_round : Icons.sunny ;
