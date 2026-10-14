import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../utils/breakpoints.dart';
import 'reveal.dart';

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
                  horizontal: mobile ? 16 : 32,
                  vertical: mobile ? 48 : 96,
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
    return Reveal(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 28,
                height: 2,
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  eyebrow.toUpperCase(),
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: AppColors.accent,
                    letterSpacing: 2.2,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: theme.textTheme.headlineLarge?.copyWith(
              fontSize: MediaQuery.sizeOf(context).width < 720 ? 26 : 32,
              letterSpacing: -0.6,
            ),
          ),
          if (lead != null) ...[
            const SizedBox(height: 14),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Text(lead!, style: theme.textTheme.bodyLarge),
            ),
          ],
        ],
      ),
    );
  }
}
