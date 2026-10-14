import 'package:flutter/material.dart';
import 'package:portfolio/generated/app_localizations.dart';

import '../data/portfolio_data.dart';
import '../l10n/l10n_lookup.dart';
import '../models/expertise.dart';
import '../theme/app_colors.dart';
import '../utils/icon_map.dart';
import '../widgets/hover_card.dart';
import '../widgets/responsive_grid.dart';
import '../widgets/reveal.dart';
import '../widgets/section_shell.dart';
import '../widgets/status_chip.dart';

class ExpertiseSection extends StatelessWidget {
  const ExpertiseSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final featured = PortfolioData.expertise.where((e) => e.featured).toList();
    final rest = PortfolioData.expertise.where((e) => !e.featured).toList();

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
          const SizedBox(height: 28),
          ResponsiveGrid(
            desktopColumns: 3,
            children: [
              for (var i = 0; i < featured.length; i++)
                Reveal(
                  delay: Duration(milliseconds: 60 * i),
                  child: _ExpertiseCard(item: featured[i], featured: true),
                ),
            ],
          ),
          const SizedBox(height: 20),
          ResponsiveGrid(
            desktopColumns: 4,
            children: [
              for (var i = 0; i < rest.length; i++)
                Reveal(
                  delay: Duration(milliseconds: 60 * i),
                  child: _ExpertiseCard(item: rest[i]),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ExpertiseCard extends StatelessWidget {
  const _ExpertiseCard({required this.item, this.featured = false});

  final ExpertiseItem item;
  final bool featured;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final title = l10nLookup(l10n, item.titleKey);
    final body = l10nLookup(l10n, item.bodyKey);

    return HoverCard(
      semanticLabel: title,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: featured
                      ? AppColors.accent.withOpacity(0.16)
                      : AppColors.blueBright.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  iconFromName(item.iconName),
                  color: featured ? AppColors.accent : AppColors.blueBright,
                  size: 24,
                ),
              ),
              const Spacer(),
              if (featured)
                StatusChip(label: l10n.expertiseSignature, tone: ChipTone.accent),
            ],
          ),
          const SizedBox(height: 16),
          Text(title, style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(body, style: theme.textTheme.bodySmall),
        ],
      ),
    );
  }
}
