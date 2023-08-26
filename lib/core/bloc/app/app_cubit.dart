import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/config/app_locale.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit()
      : super(
      AppState(themeMode: ThemeMode.light, locale: AppLocale.english));

  void changeTheme(ThemeMode themeMode) {
    emit(state.copyWith(newThemeMode: themeMode, newIsRefreshApp: false));
  }

  changeLocale(Locale locale) {
    emit(state.copyWith(newLocale: locale, newIsRefreshApp: true));
  }
}