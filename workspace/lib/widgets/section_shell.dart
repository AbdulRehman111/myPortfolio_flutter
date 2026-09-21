import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../utils/breakpoints.dart';

class SectionShell extends StatelessWidget {
  const SectionShell({
    super.key,
    required this.id,
    required this.child,
    this.alternate = false,
    this.padding,
  });

  final String id;
  final Widget child;
  final bool alternate;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mobile = Breakpoints.isMobile(context);
    final color = alternate
        ? (theme.brightness == Brightness.dark
            ? AppColors.navyMid
            : const Color(0xFFEEF3F8))
        : theme.scaffoldBackgroundColor;

    return ColoredBox(
      key: ValueKey('section-$id'),
      color: color,
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: Breakpoints.content),
          child: Padding(
            padding: padding ??
                EdgeInsets.symmetric(
                  horizontal: mobile ? 20 : 32,
                  vertical: mobile ? 64 : 96,
                ),
            child: child,
          ),
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.eyebrow,
    required this.title,
    this.lead,
  });

  final String eyebrow;
  final String title;
  final String? lead;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          eyebrow.toUpperCase(),
          style: theme.textTheme.labelLarge?.copyWith(
            color: AppColors.accent,
            letterSpacing: 1.6,
          ),
        ),
        const SizedBox(height: 12),
        Text(title, style: theme.textTheme.headlineLarge),
        if (lead != null) ...[
          const SizedBox(height: 14),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Text(lead!, style: theme.textTheme.bodyLarge),
          ),
        ],
      ],
    );
  }
}
