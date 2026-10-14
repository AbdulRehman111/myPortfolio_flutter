import 'package:flutter/material.dart';

class Breakpoints {
  const Breakpoints._();

  static const double mobile = 720;
  static const double tablet = 1100;
  static const double content = 1180;

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < mobile;

  static bool isTablet(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    return w >= mobile && w < tablet;
  }

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= tablet;

  static int columns(BuildContext context, {int desktop = 3}) {
    final w = MediaQuery.sizeOf(context).width;
    if (w < mobile) return 1;
    if (w < tablet) return 2;
    return desktop;
  }
}
