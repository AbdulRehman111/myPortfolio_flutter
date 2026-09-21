import 'package:flutter/material.dart';

import '../services/preferences_service.dart';

class AppSettings extends ChangeNotifier {
  AppSettings({
    required Locale locale,
    required ThemeMode themeMode,
  })  : _locale = locale,
        _themeMode = themeMode;

  Locale _locale;
  ThemeMode _themeMode;

  Locale get locale => _locale;
  ThemeMode get themeMode => _themeMode;
  bool get isArabic => _locale.languageCode == 'ar';

  Future<void> setLocale(Locale locale) async {
    if (_locale == locale) return;
    _locale = locale;
    notifyListeners();
    await PreferencesService.instance.saveLocale(locale);
  }

  Future<void> toggleLocale() =>
      setLocale(isArabic ? const Locale('en') : const Locale('ar'));

  Future<void> setThemeMode(ThemeMode mode) async {
    if (_themeMode == mode) return;
    _themeMode = mode;
    notifyListeners();
    await PreferencesService.instance.saveThemeMode(mode);
  }

  Future<void> cycleTheme() {
    final next = switch (_themeMode) {
      ThemeMode.system => ThemeMode.light,
      ThemeMode.light => ThemeMode.dark,
      ThemeMode.dark => ThemeMode.system,
    };
    return setThemeMode(next);
  }
}

class AppSettingsScope extends InheritedNotifier<AppSettings> {
  const AppSettingsScope({
    super.key,
    required AppSettings settings,
    required super.child,
  }) : super(notifier: settings);

  static AppSettings of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<AppSettingsScope>();
    assert(scope != null, 'AppSettingsScope not found');
    return scope!.notifier!;
  }
}
