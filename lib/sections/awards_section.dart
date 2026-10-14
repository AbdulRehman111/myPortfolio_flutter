import 'package:flutter/material.dart';
import 'package:portfolio/generated/app_localizations.dart';

import '../app/app_settings.dart';
import '../data/portfolio_data.dart';
import '../widgets/hover_card.dart';
import '../widgets/responsive_grid.dart';
import '../widgets/reveal.dart';
import '../widgets/safe_image.dart';
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
              for (var i = 0; i < PortfolioData.awards.length; i++)
                Reveal(
                  delay: Duration(milliseconds: 60 * i),
                  child: Builder(
                    builder: (context) {
                      final award = PortfolioData.awards[i];
                      return HoverCard(
                  padding: EdgeInsets.zero,
                  onTap: () => _openPreview(
                    context,
                    award.imageAsset,
                    award.title.resolve(lang),
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
                            asset: award.imageAsset,
                            fit: BoxFit.cover,
                            fallbackIcon: Icons.emoji_events_outlined,
                            label: award.title.resolve(lang),
                          ),
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
                      fallbackIcon: Icons.emoji_events_outlined,
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
