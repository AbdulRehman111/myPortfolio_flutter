import 'package:flutter/material.dart';
import 'package:portfolio/generated/app_localizations.dart';

import '../app/app_settings.dart';
import '../data/portfolio_data.dart';
import '../utils/launch_helper.dart';
import '../widgets/hover_card.dart';
import '../widgets/responsive_grid.dart';
import '../widgets/reveal.dart';
import '../widgets/safe_image.dart';
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
              for (var i = 0; i < PortfolioData.certifications.length; i++)
                Reveal(
                  delay: Duration(milliseconds: 60 * i),
                  child: Builder(
                    builder: (context) {
                      final cert = PortfolioData.certifications[i];
                      return HoverCard(
                  padding: EdgeInsets.zero,
                  onTap: () => _openPreview(
                    context,
                    cert.imageAsset,
                    cert.title.resolve(lang),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                      child: AspectRatio(
                        aspectRatio: 4 / 3,
                        child: SafeImage(
                          asset: cert.imageAsset,
                          fit: BoxFit.cover,
                          fallbackIcon: Icons.workspace_premium_outlined,
                          label: cert.title.resolve(lang),
                        ),
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
                );
                    },
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  void _openPreview(BuildContext context, String asset, String title) {
    showDialog<void>(
      context: context,
      builder: (ctx) {
        return Dialog(
          insetPadding: const EdgeInsets.all(16),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720, maxHeight: 720),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(title, style: Theme.of(ctx).textTheme.titleMedium),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(ctx),
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: InteractiveViewer(
                    child: SafeImage(
                      asset: asset,
                      fit: BoxFit.contain,
                      fallbackIcon: Icons.workspace_premium_outlined,
                      label: title,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
