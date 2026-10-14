import 'package:flutter/material.dart';
import 'package:portfolio/generated/app_localizations.dart';

import '../data/portfolio_data.dart';
import '../l10n/l10n_lookup.dart';
import '../models/skill.dart';
import '../theme/app_colors.dart';
import '../utils/icon_map.dart';
import '../widgets/hover_card.dart';
import '../widgets/responsive_grid.dart';
import '../widgets/reveal.dart';
import '../widgets/section_shell.dart';
import '../widgets/status_chip.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final q = _query.trim().toLowerCase();
    bool matches(SkillGroup g) {
      if (q.isEmpty) return true;
      if (l10nLookup(l10n, g.titleKey).toLowerCase().contains(q)) return true;
      return g.items.any((s) => s.toLowerCase().contains(q));
    }
    final featured = PortfolioData.skillGroups.where((g) => g.featured && matches(g)).toList();
    final rest = PortfolioData.skillGroups.where((g) => !g.featured && matches(g)).toList();

    return SectionShell(
      id: 'skills',
      alternate: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            eyebrow: l10n.skillsEyebrow,
            title: l10n.skillsTitle,
            lead: l10n.skillsLead,
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: l10n.skillSearch,
              prefixIcon: const Icon(Icons.search),
              border: const OutlineInputBorder(),
            ),
            onChanged: (v) => setState(() => _query = v),
          ),
          const SizedBox(height: 28),
          Text(
            l10n.skillsSignature,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppColors.accent,
                  letterSpacing: 0.6,
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 14),
          ResponsiveGrid(
            desktopColumns: 2,
            children: [
              for (var i = 0; i < featured.length; i++)
                Reveal(
                  delay: Duration(milliseconds: 70 * i),
                  child: _SkillCard(group: featured[i], featured: true),
                ),
            ],
          ),
          const SizedBox(height: 36),
          Text(
            l10n.skillsAll,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppColors.accent,
                  letterSpacing: 0.6,
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 14),
          ResponsiveGrid(
            desktopColumns: 2,
            children: [
              for (var i = 0; i < rest.length; i++)
                Reveal(
                  delay: Duration(milliseconds: 70 * i),
                  child: _SkillCard(group: rest[i]),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SkillCard extends StatelessWidget {
  const _SkillCard({required this.group, this.featured = false});

  final SkillGroup group;
  final bool featured;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final title = l10nLookup(l10n, group.titleKey);

    return HoverCard(
      semanticLabel: title,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: featured
                      ? AppColors.accent.withOpacity(0.16)
                      : AppColors.blueBright.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  iconFromName(group.iconName),
                  color: featured ? AppColors.accent : AppColors.blueBright,
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(title, style: theme.textTheme.titleMedium),
              ),
              if (featured)
                StatusChip(label: l10n.expertiseSignature, tone: ChipTone.accent),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final skill in group.items) TechChip(label: skill),
            ],
          ),
        ],
      ),
    );
  }
}
