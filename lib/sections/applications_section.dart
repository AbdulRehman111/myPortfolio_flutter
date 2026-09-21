import 'package:flutter/material.dart';
import 'package:portfolio/generated/app_localizations.dart';

import '../app/app_settings.dart';
import '../data/portfolio_data.dart';
import '../utils/launch_helper.dart';
import '../widgets/hover_card.dart';
import '../widgets/responsive_grid.dart';
import '../widgets/section_shell.dart';
import '../widgets/status_chip.dart';

class ApplicationsSection extends StatelessWidget {
  const ApplicationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final lang = AppSettingsScope.of(context).locale.languageCode;
    final theme = Theme.of(context);

    return SectionShell(
      id: 'applications',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            eyebrow: l10n.appsEyebrow,
            title: l10n.appsTitle,
            lead: l10n.appsLead,
          ),
          const SizedBox(height: 32),
          ResponsiveGrid(
            desktopColumns: 2,
            children: [
              for (final app in PortfolioData.applications)
                HoverCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              app.iconAsset,
                              width: 64,
                              height: 64,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  app.name.resolve(lang),
                                  style: theme.textTheme.titleMedium,
                                ),
                                if (app.isPlaceholder)
                                  StatusChip(
                                    label: l10n.placeholderBadge,
                                    tone: ChipTone.warn,
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Text(app.description.resolve(lang), style: theme.textTheme.bodySmall),
                      const SizedBox(height: 12),
                      if (app.screenshots.isNotEmpty)
                        SizedBox(
                          height: 160,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: app.screenshots.length,
                            separatorBuilder: (_, __) => const SizedBox(width: 8),
                            itemBuilder: (context, i) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(app.screenshots[i]),
                              );
                            },
                          ),
                        ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: [
                          for (final t in app.technologies) TechChip(label: t),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        children: [
                          if (app.hasPlay)
                            OutlinedButton(
                              onPressed: () => openExternal(app.playStoreUrl!),
                              child: Text(l10n.actionPlay),
                            ),
                          if (app.hasAppStore)
                            OutlinedButton(
                              onPressed: () => openExternal(app.appStoreUrl!),
                              child: Text(l10n.actionAppStore),
                            ),
                          if (app.hasDemo)
                            OutlinedButton(
                              onPressed: () => openExternal(app.demoUrl!),
                              child: Text(l10n.actionDemo),
                            ),
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
