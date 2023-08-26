part of 'app_cubit.dart';

class AppState {
  final ThemeMode themeMode;
  final Locale locale;
  final bool isRefreshApp;

  const AppState(
      {required this.themeMode, required this.locale, this.isRefreshApp = false});

  AppState copyWith({
    ThemeMode? newThemeMode,
    Locale? newLocale,
    bool? newIsRefreshApp,
  }) {
    return AppState(
      themeMode: newThemeMode ?? themeMode,
      locale: newLocale ?? locale,
      isRefreshApp: newIsRefreshApp ?? isRefreshApp,
    );
  }
}
