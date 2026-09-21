import 'package:flutter/material.dart';

import 'app/app_settings.dart';
import 'app/portfolio_app.dart';
import 'services/preferences_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesService.instance.init();
  final prefs = PreferencesService.instance;
  final settings = AppSettings(
    locale: prefs.readLocale() ?? const Locale('en'),
    themeMode: prefs.readThemeMode(),
  );
  runApp(PortfolioApp(settings: settings));
}
