part of 'theme_cubit.dart';

class ThemeState {
  final ThemeMode themeMode;
  final Locale locale;
  final bool isRefreshApp;

  const ThemeState(
      {required this.themeMode, required this.locale, this.isRefreshApp = false});

  ThemeState copyWith({
    ThemeMode? newThemeMode,
    Locale? newLocale,
    bool? newIsRefreshApp,
  }) {
    return ThemeState(
      themeMode: newThemeMode ?? themeMode,
      locale: newLocale ?? locale,
      isRefreshApp: newIsRefreshApp ?? isRefreshApp,
    );
  }
}
