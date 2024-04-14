import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../config/app_locale.dart';
import '../../services/storage_service.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final StorageService storageService;
  ThemeCubit({required this.storageService}) : super(ThemeState(
            themeMode: storageService.loadThemeMode(),
            locale: storageService.loadLocale()));

  void changeTheme() {
    ThemeMode themeMode = state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    emit(state.copyWith(newThemeMode: themeMode, newIsRefreshApp: false));
    storageService.saveThemeMode(themeMode: themeMode);
  }

  void changeLocale() {
    Locale locale = state.locale == AppLocale.persian ? AppLocale.english : AppLocale.persian;
    emit(state.copyWith(newLocale: locale, newIsRefreshApp: true));
    storageService.saveLocale(locale: locale);
  }
}
