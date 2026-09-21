import 'package:flutter/material.dart';
import 'package:portfolio/generated/app_localizations.dart';

import '../data/portfolio_data.dart';
import '../l10n/l10n_lookup.dart';
import '../theme/app_colors.dart';
import '../utils/icon_map.dart';
import '../widgets/hover_card.dart';
import '../widgets/responsive_grid.dart';
import '../widgets/section_shell.dart';
import '../widgets/status_chip.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return SectionShell(
      id: 'skills',
      alternate: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            eyebrow: l10n.skillsEyebrow,
            title: l10n.skillsTitle,
            lead: l10n.skillsLead,
          ),
          const SizedBox(height: 32),
          ResponsiveGrid(
            desktopColumns: 2,
            children: [
              for (final group in PortfolioData.skillGroups)
                HoverCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            iconFromName(group.iconName),
                            color: AppColors.blueBright,
                            size: 22,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            l10nLookup(l10n, group.titleKey),
                            style: theme.textTheme.titleMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final skill in group.items) TechChip(label: skill),
                        ],
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
