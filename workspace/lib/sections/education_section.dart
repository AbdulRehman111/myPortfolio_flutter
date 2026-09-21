import 'package:flutter/material.dart';
import 'package:portfolio/generated/app_localizations.dart';

import '../app/app_settings.dart';
import '../data/portfolio_data.dart';
import '../theme/app_colors.dart';
import '../widgets/hover_card.dart';
import '../widgets/section_shell.dart';
import '../widgets/status_chip.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final lang = AppSettingsScope.of(context).locale.languageCode;
    final theme = Theme.of(context);

    return SectionShell(
      id: 'education',
      alternate: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            eyebrow: l10n.educationEyebrow,
            title: l10n.educationTitle,
            lead: l10n.educationLead,
          ),
          const SizedBox(height: 28),
          for (final item in PortfolioData.education)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: HoverCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.school_outlined, color: AppColors.blueBright),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            item.institution.resolve(lang),
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                        StatusChip(
                          label: item.confirmed ? l10n.confirmedBadge : l10n.pendingBadge,
                          tone: item.confirmed ? ChipTone.confirm : ChipTone.warn,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(item.degree.resolve(lang)),
                    Text(item.dates.resolve(lang), style: theme.textTheme.bodySmall),
                    const SizedBox(height: 8),
                    Text(item.description.resolve(lang), style: theme.textTheme.bodySmall),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
