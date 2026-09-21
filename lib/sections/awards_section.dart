import 'package:flutter/material.dart';
import 'package:portfolio/generated/app_localizations.dart';

import '../app/app_settings.dart';
import '../data/portfolio_data.dart';
import '../widgets/hover_card.dart';
import '../widgets/responsive_grid.dart';
import '../widgets/section_shell.dart';
import '../widgets/status_chip.dart';

class AwardsSection extends StatelessWidget {
  const AwardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final lang = AppSettingsScope.of(context).locale.languageCode;
    final theme = Theme.of(context);

    return SectionShell(
      id: 'awards',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            eyebrow: l10n.awardsEyebrow,
            title: l10n.awardsTitle,
            lead: l10n.awardsLead,
          ),
          const SizedBox(height: 32),
          ResponsiveGrid(
            desktopColumns: 3,
            children: [
              for (final award in PortfolioData.awards)
                HoverCard(
                  padding: EdgeInsets.zero,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                        child: AspectRatio(
                          aspectRatio: 4 / 3,
                          child: Image.asset(award.imageAsset, fit: BoxFit.cover),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (award.isPlaceholder)
                              StatusChip(
                                label: l10n.placeholderBadge,
                                tone: ChipTone.warn,
                              ),
                            const SizedBox(height: 8),
                            Text(award.title.resolve(lang), style: theme.textTheme.titleMedium),
                            const SizedBox(height: 4),
                            Text(award.organization.resolve(lang), style: theme.textTheme.bodySmall),
                            Text(award.date.resolve(lang), style: theme.textTheme.bodySmall),
                            const SizedBox(height: 8),
                            Text(award.description.resolve(lang), style: theme.textTheme.bodySmall),
                          ],
                        ),
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
