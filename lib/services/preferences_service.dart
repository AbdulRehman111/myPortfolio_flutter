import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  PreferencesService._();
  static final PreferencesService instance = PreferencesService._();

  static const _localeKey = 'locale_code';
  static const _themeKey = 'theme_mode';
  static const _draftKey = 'brief_draft';

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Locale? readLocale() {
    final code = _prefs?.getString(_localeKey);
    if (code == 'ar' || code == 'en') return Locale(code!);
    return null;
  }

  Future<void> saveLocale(Locale locale) async {
    await _prefs?.setString(_localeKey, locale.languageCode);
  }

  ThemeMode readThemeMode() {
    switch (_prefs?.getString(_themeKey)) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  Future<void> saveThemeMode(ThemeMode mode) async {
    final value = switch (mode) {
      ThemeMode.light => 'light',
      ThemeMode.dark => 'dark',
      ThemeMode.system => 'system',
    };
    await _prefs?.setString(_themeKey, value);
  }

  Map<String, String> readBriefDraft() {
    final raw = _prefs?.getString(_draftKey);
    if (raw == null || raw.isEmpty) return const {};
    try {
      final parts = raw.split('\u001f');
      if (parts.length < 4) return const {};
      return {
        'name': parts[0],
        'email': parts[1],
        'subject': parts[2],
        'message': parts[3],
      };
    } catch (_) {
      return const {};
    }
  }

  Future<void> saveBriefDraft({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    await _prefs?.setString(
      _draftKey,
      '$name\u001f$email\u001f$subject\u001f$message',
    );
  }

  Future<void> clearBriefDraft() async {
    await _prefs?.remove(_draftKey);
  }
}
