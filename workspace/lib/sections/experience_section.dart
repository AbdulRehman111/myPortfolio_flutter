import 'package:flutter/material.dart';
import 'package:portfolio/generated/app_localizations.dart';

import '../app/app_settings.dart';
import '../data/portfolio_data.dart';
import '../theme/app_colors.dart';
import '../widgets/section_shell.dart';
import '../widgets/status_chip.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final lang = AppSettingsScope.of(context).locale.languageCode;
    final theme = Theme.of(context);

    return SectionShell(
      id: 'experience',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            eyebrow: l10n.experienceEyebrow,
            title: l10n.experienceTitle,
            lead: l10n.experienceLead,
          ),
          const SizedBox(height: 36),
          for (final item in PortfolioData.experience)
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: const BoxDecoration(
                        color: AppColors.accent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surface,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: theme.dividerColor),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              if (item.confirmed)
                                StatusChip(
                                  label: l10n.confirmedBadge,
                                  tone: ChipTone.confirm,
                                ),
                              if (item.isPlaceholder)
                                StatusChip(
                                  label: l10n.pendingBadge,
                                  tone: ChipTone.warn,
                                ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            item.position.resolve(lang),
                            style: theme.textTheme.titleLarge,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item.company.resolve(lang),
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: AppColors.blueBright,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item.dates.resolve(lang),
                            style: theme.textTheme.bodySmall,
                          ),
                          const SizedBox(height: 12),
                          Text(item.description.resolve(lang)),
                          const SizedBox(height: 12),
                          for (final r in item.responsibilities.resolve(lang))
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('•  '),
                                  Expanded(child: Text(r)),
                                ],
                              ),
                            ),
                          if (item.technologies.isNotEmpty) ...[
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 6,
                              runSpacing: 6,
                              children: [
                                for (final t in item.technologies)
                                  TechChip(label: t),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
