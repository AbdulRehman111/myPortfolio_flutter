import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/app/app_settings.dart';
import 'package:portfolio/app/portfolio_app.dart';

void main() {
  testWidgets('renders portfolio name', (tester) async {
    final settings = AppSettings(
      locale: const Locale('en'),
      themeMode: ThemeMode.light,
    );
    await tester.pumpWidget(PortfolioApp(settings: settings));
    await tester.pump();
    expect(find.textContaining('Abdul Rehman'), findsWidgets);
  });
}
