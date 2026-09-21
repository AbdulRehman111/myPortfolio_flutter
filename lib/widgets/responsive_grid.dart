import 'package:flutter/material.dart';

import '../utils/breakpoints.dart';

class ResponsiveGrid extends StatelessWidget {
  const ResponsiveGrid({
    super.key,
    required this.children,
    this.desktopColumns = 3,
    this.gap = 20,
    this.childAspectRatio,
  });

  final List<Widget> children;
  final int desktopColumns;
  final double gap;
  final double? childAspectRatio;

  @override
  Widget build(BuildContext context) {
    final cols = Breakpoints.columns(context, desktop: desktopColumns);
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final itemW = (width - gap * (cols - 1)) / cols;
        return Wrap(
          spacing: gap,
          runSpacing: gap,
          children: [
            for (final child in children)
              SizedBox(
                width: itemW,
                child: childAspectRatio == null
                    ? child
                    : AspectRatio(aspectRatio: childAspectRatio!, child: child),
              ),
          ],
        );
      },
    );
  }
}
