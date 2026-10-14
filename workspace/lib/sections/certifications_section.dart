import 'package:flutter/material.dart';
import 'package:portfolio/generated/app_localizations.dart';

import '../app/app_settings.dart';
import '../data/portfolio_data.dart';
import '../utils/launch_helper.dart';
import '../widgets/hover_card.dart';
import '../widgets/responsive_grid.dart';
import '../widgets/section_shell.dart';
import '../widgets/status_chip.dart';

class CertificationsSection extends StatelessWidget {
  const CertificationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final lang = AppSettingsScope.of(context).locale.languageCode;
    final theme = Theme.of(context);

    return SectionShell(
      id: 'certifications',
      alternate: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            eyebrow: l10n.certsEyebrow,
            title: l10n.certsTitle,
            lead: l10n.certsLead,
          ),
          const SizedBox(height: 32),
          ResponsiveGrid(
            desktopColumns: 3,
            children: [
              for (final cert in PortfolioData.certifications)
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
                          child: Image.asset(cert.imageAsset, fit: BoxFit.cover),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (cert.isPlaceholder)
                              StatusChip(
                                label: l10n.placeholderBadge,
                                tone: ChipTone.warn,
                              ),
                            const SizedBox(height: 8),
                            Text(cert.title.resolve(lang), style: theme.textTheme.titleMedium),
                            const SizedBox(height: 4),
                            Text(cert.organization.resolve(lang), style: theme.textTheme.bodySmall),
                            Text(cert.date.resolve(lang), style: theme.textTheme.bodySmall),
                            const SizedBox(height: 8),
                            Text(cert.description.resolve(lang), style: theme.textTheme.bodySmall),
                            if (cert.hasCredential) ...[
                              const SizedBox(height: 12),
                              OutlinedButton(
                                onPressed: () => openExternal(cert.credentialUrl!),
                                child: Text(l10n.actionView),
                              ),
                            ],
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
