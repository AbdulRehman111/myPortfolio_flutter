import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  const AppTheme._();

  static const String latinFamily = 'Inter';
  static const String arabicFamily = 'NotoSansArabic';

  static String fontFamilyFor(Locale locale) =>
      locale.languageCode == 'ar' ? arabicFamily : latinFamily;

  static ThemeData light(Locale locale) => _build(
        brightness: Brightness.light,
        locale: locale,
        scaffold: AppColors.lightBg,
        surface: AppColors.lightSurface,
        text: AppColors.lightText,
        muted: AppColors.lightMuted,
        border: AppColors.lightBorder,
      );

  static ThemeData dark(Locale locale) => _build(
        brightness: Brightness.dark,
        locale: locale,
        scaffold: AppColors.darkBg,
        surface: AppColors.darkSurface,
        text: AppColors.darkText,
        muted: AppColors.darkMuted,
        border: AppColors.darkBorder,
      );

  static ThemeData _build({
    required Brightness brightness,
    required Locale locale,
    required Color scaffold,
    required Color surface,
    required Color text,
    required Color muted,
    required Color border,
  }) {
    final family = fontFamilyFor(locale);
    final isDark = brightness == Brightness.dark;
    final scheme = ColorScheme(
      brightness: brightness,
      primary: AppColors.blue,
      onPrimary: Colors.white,
      secondary: AppColors.accent,
      onSecondary: AppColors.navy,
      error: const Color(0xFFB42318),
      onError: Colors.white,
      surface: surface,
      onSurface: text,
    );

    final textTheme = _textTheme(family, text, muted);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: scaffold,
      fontFamily: family,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: surface.withOpacity(0.92),
        foregroundColor: text,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: textTheme.titleMedium,
      ),
      cardTheme: CardThemeData(
        color: surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: border),
        ),
      ),
      dividerColor: border,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: isDark ? AppColors.navyMid : const Color(0xFFF1F5F9),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.blueBright, width: 1.4),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blue,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textStyle: TextStyle(
            fontFamily: family,
            fontWeight: FontWeight.w600,
            fontSize: 14,
            letterSpacing: 0.2,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: text,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          side: BorderSide(color: border),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textStyle: TextStyle(
            fontFamily: family,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.blueBright,
          textStyle: TextStyle(fontFamily: family, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  static TextTheme _textTheme(String family, Color text, Color muted) {
    TextStyle base({
      double size = 16,
      FontWeight weight = FontWeight.w400,
      double height = 1.5,
      Color? color,
      double letter = 0,
    }) {
      return TextStyle(
        fontFamily: family,
        fontSize: size,
        fontWeight: weight,
        height: height,
        color: color ?? text,
        letterSpacing: letter,
      );
    }

    return TextTheme(
      displayLarge:
          base(size: 52, weight: FontWeight.w700, height: 1.15, letter: -0.8),
      displayMedium:
          base(size: 40, weight: FontWeight.w700, height: 1.2, letter: -0.4),
      headlineLarge: base(size: 32, weight: FontWeight.w700, height: 1.25),
      headlineMedium: base(size: 26, weight: FontWeight.w600, height: 1.3),
      titleLarge: base(size: 20, weight: FontWeight.w600),
      titleMedium: base(size: 16, weight: FontWeight.w600),
      titleSmall: base(size: 14, weight: FontWeight.w600),
      bodyLarge: base(size: 17, height: 1.7),
      bodyMedium: base(size: 15, height: 1.65),
      bodySmall: base(size: 13, color: muted, height: 1.55),
      labelLarge: base(size: 13, weight: FontWeight.w600, letter: 0.4),
      labelMedium:
          base(size: 12, weight: FontWeight.w500, color: muted, letter: 0.3),
    );
  }
}
