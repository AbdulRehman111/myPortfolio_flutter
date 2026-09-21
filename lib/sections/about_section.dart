import 'package:flutter/material.dart';
import 'package:portfolio/generated/app_localizations.dart';

import '../theme/app_colors.dart';
import '../utils/breakpoints.dart';
import '../widgets/hover_card.dart';
import '../widgets/section_shell.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final highlights = [
      (l10n.aboutHighlight1Title, l10n.aboutHighlight1Body),
      (l10n.aboutHighlight2Title, l10n.aboutHighlight2Body),
      (l10n.aboutHighlight3Title, l10n.aboutHighlight3Body),
      (l10n.aboutHighlight4Title, l10n.aboutHighlight4Body),
    ];

    return SectionShell(
      id: 'about',
      alternate: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            eyebrow: l10n.aboutEyebrow,
            title: l10n.aboutTitle,
          ),
          const SizedBox(height: 28),
          Text(l10n.aboutP1, style: theme.textTheme.bodyLarge),
          const SizedBox(height: 16),
          Text(l10n.aboutP2, style: theme.textTheme.bodyLarge),
          const SizedBox(height: 16),
          Text(l10n.aboutP3, style: theme.textTheme.bodyLarge),
          const SizedBox(height: 28),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: AppColors.navy,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.lifecycleTitle,
                  style: theme.textTheme.titleMedium?.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.lifecycleBody,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFFD5DEEA),
                    height: 1.7,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, constraints) {
              final cols = Breakpoints.columns(context, desktop: 4);
              final gap = 16.0;
              final w = (constraints.maxWidth - gap * (cols - 1)) / cols;
              return Wrap(
                spacing: gap,
                runSpacing: gap,
                children: [
                  for (final item in highlights)
                    SizedBox(
                      width: w,
                      child: HoverCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.$1,
                              style: theme.textTheme.titleLarge?.copyWith(
                                color: AppColors.blueBright,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(item.$2, style: theme.textTheme.bodySmall),
                          ],
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
