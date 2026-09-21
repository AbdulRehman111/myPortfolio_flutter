import 'package:flutter/material.dart';
import 'package:portfolio/generated/app_localizations.dart';

import '../data/portfolio_data.dart';
import '../l10n/l10n_lookup.dart';
import '../theme/app_colors.dart';
import '../utils/icon_map.dart';
import '../widgets/hover_card.dart';
import '../widgets/responsive_grid.dart';
import '../widgets/section_shell.dart';

class ExpertiseSection extends StatelessWidget {
  const ExpertiseSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return SectionShell(
      id: 'expertise',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            eyebrow: l10n.expertiseEyebrow,
            title: l10n.expertiseTitle,
            lead: l10n.expertiseLead,
          ),
          const SizedBox(height: 32),
          ResponsiveGrid(
            desktopColumns: 4,
            children: [
              for (final item in PortfolioData.expertise)
                HoverCard(
                  semanticLabel: l10nLookup(l10n, item.titleKey),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        iconFromName(item.iconName),
                        color: AppColors.blueBright,
                        size: 28,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        l10nLookup(l10n, item.titleKey),
                        style: theme.textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        l10nLookup(l10n, item.bodyKey),
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
