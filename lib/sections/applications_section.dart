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
              for (var i = 0; i < PortfolioData.applications.length; i++)
                Reveal(
                  delay: Duration(milliseconds: 70 * i),
                  child: Builder(
                    builder: (context) {
                      final app = PortfolioData.applications[i];
                      return HoverCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: SizedBox(
                              width: 64,
                              height: 64,
                              child: SafeImage(
                                asset: app.iconAsset,
                                width: 64,
                                height: 64,
                                fit: BoxFit.cover,
                                fallbackIcon: Icons.smartphone_outlined,
                              ),
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
                          height: MediaQuery.sizeOf(context).width < 720 ? 168 : 160,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: app.screenshots.length,
                            separatorBuilder: (_, __) => const SizedBox(width: 8),
                            itemBuilder: (context, i) {
                              final phone = MediaQuery.sizeOf(context).width < 720;
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: SizedBox(
                                  width: phone ? 98 : 200,
                                  child: SafeImage(
                                    asset: app.screenshots[i],
                                    width: phone ? 98 : 200,
                                    fit: BoxFit.cover,
                                    fallbackIcon: Icons.photo_outlined,
                                  ),
                                ),
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
}
