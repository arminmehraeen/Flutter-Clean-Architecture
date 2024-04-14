import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'config/app_locale.dart';
import 'config/app_main.dart';
import 'config/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  /// init locator
  await setup();

  runApp(
    EasyLocalization(
        supportedLocales: AppLocale.locales,
        path: AppLocale.translationsPath,
        fallbackLocale: AppLocale.fallbackLocale,
        saveLocale: true,
        child: const AppMain())
  );
}
