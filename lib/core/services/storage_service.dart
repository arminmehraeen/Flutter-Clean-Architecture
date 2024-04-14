import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/app_locale.dart';
import '../utils/constants.dart';

class StorageService {

  final SharedPreferences prefs;
  StorageService(this.prefs);

  Future<void> saveThemeMode({required ThemeMode themeMode}) async {
    bool store = themeMode == ThemeMode.dark ? true : false;
    await prefs.setBool(Keys.themeMode, store);
  }

  Future<void> saveLocale({required Locale locale}) async {
    bool store = locale == AppLocale.persian ? true : false;
    await prefs.setBool(Keys.locale, store);
  }

  ThemeMode loadThemeMode() {
    bool isDarkMode = prefs.getBool(Keys.themeMode) ?? false ;
    return isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  Locale loadLocale() {
    bool isPersian = prefs.getBool(Keys.locale) ?? true;
    return isPersian ? AppLocale.persian : AppLocale.english;
  }

}


