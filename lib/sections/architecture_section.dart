import 'package:flutter/material.dart';
import 'package:portfolio/generated/app_localizations.dart';

import '../data/portfolio_data.dart';
import '../l10n/l10n_lookup.dart';
import '../theme/app_colors.dart';
import '../utils/breakpoints.dart';
import '../utils/icon_map.dart';
import '../widgets/section_shell.dart';

class ArchitectureSection extends StatelessWidget {
  const ArchitectureSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final steps = PortfolioData.architecture;
    final mobile = Breakpoints.isMobile(context);

    return SectionShell(
      id: 'architecture',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            eyebrow: l10n.archEyebrow,
            title: l10n.archTitle,
            lead: l10n.archLead,
          ),
          const SizedBox(height: 36),
          if (mobile)
            Column(
              children: [
                for (var i = 0; i < steps.length; i++) ...[
                  _StepCard(index: i, title: l10nLookup(l10n, steps[i].titleKey), body: l10nLookup(l10n, steps[i].bodyKey), icon: steps[i].iconName),
                  if (i != steps.length - 1)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: theme.dividerColor,
                      ),
                    ),
                ],
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < steps.length; i++) ...[
                  Expanded(
                    child: _StepCard(
                      index: i,
                      title: l10nLookup(l10n, steps[i].titleKey),
                      body: l10nLookup(l10n, steps[i].bodyKey),
                      icon: steps[i].iconName,
                    ),
                  ),
                  if (i != steps.length - 1)
                    Padding(
                      padding: const EdgeInsetsDirectional.only(top: 28),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                        color: AppColors.accent,
                      ),
                    ),
                ],
              ],
            ),
        ],
      ),
    );
  }
}

class _StepCard extends StatelessWidget {
  const _StepCard({
    required this.index,
    required this.title,
    required this.body,
    required this.icon,
  });

  final int index;
  final String title;
  final String body;
  final String icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: AppColors.navy,
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              const SizedBox(width: 10),
              Icon(iconFromName(icon), color: AppColors.blueBright, size: 20),
            ],
          ),
          const SizedBox(height: 14),
          Text(title, style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          Text(body, style: theme.textTheme.bodySmall),
        ],
      ),
    );
  }
}
