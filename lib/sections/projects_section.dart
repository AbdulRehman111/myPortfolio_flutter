import 'package:flutter/material.dart';
import 'package:portfolio/generated/app_localizations.dart';

import '../app/app_settings.dart';
import '../data/portfolio_data.dart';
import '../models/models.dart';
import '../theme/app_colors.dart';
import '../utils/launch_helper.dart';
import '../widgets/hover_card.dart';
import '../widgets/responsive_grid.dart';
import '../widgets/reveal.dart';
import '../widgets/safe_image.dart';
import '../widgets/section_shell.dart';
import '../widgets/status_chip.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  ProjectCategory? _filter;
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final lang = AppSettingsScope.of(context).locale.languageCode;
    final items = PortfolioData.projects.where((p) {
      if (_filter != null && p.category != _filter) return false;
      if (_query.trim().isEmpty) return true;
      final q = _query.toLowerCase();
      final hay = [
        p.name.resolve(lang),
        p.description.resolve(lang),
        ...p.technologies,
      ].join(' ').toLowerCase();
      return hay.contains(q);
    }).toList();

    return SectionShell(
      id: 'projects',
      alternate: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            eyebrow: l10n.projectsEyebrow,
            title: l10n.projectsTitle,
            lead: l10n.projectsLead,
          ),
          const SizedBox(height: 24),
          TextField(
            decoration: InputDecoration(
              hintText: l10n.projSearch,
              prefixIcon: const Icon(Icons.search),
              border: const OutlineInputBorder(),
            ),
            onChanged: (v) => setState(() => _query = v),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _FilterChip(
                label: l10n.filterAll,
                selected: _filter == null,
                onTap: () => setState(() => _filter = null),
              ),
              _FilterChip(
                label: l10n.filterMobile,
                selected: _filter == ProjectCategory.mobile,
                onTap: () => setState(() => _filter = ProjectCategory.mobile),
              ),
              _FilterChip(
                label: l10n.filterWeb,
                selected: _filter == ProjectCategory.web,
                onTap: () => setState(() => _filter = ProjectCategory.web),
              ),
              _FilterChip(
                label: l10n.filterFullStack,
                selected: _filter == ProjectCategory.fullStack,
                onTap: () => setState(() => _filter = ProjectCategory.fullStack),
              ),
              _FilterChip(
                label: l10n.filterApi,
                selected: _filter == ProjectCategory.api,
                onTap: () => setState(() => _filter = ProjectCategory.api),
              ),
            ],
          ),
          const SizedBox(height: 28),
          if (items.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Text(l10n.noProjects, style: Theme.of(context).textTheme.bodyMedium),
            )
          else
            ResponsiveGrid(
              desktopColumns: 2,
              children: [
                for (var i = 0; i < items.length; i++)
                  Reveal(
                    delay: Duration(milliseconds: 70 * i),
                    child: _ProjectCard(project: items[i], lang: lang, l10n: l10n),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onTap(),
      selectedColor: AppColors.navy,
      labelStyle: TextStyle(
        color: selected ? Colors.white : Theme.of(context).colorScheme.onSurface,
        fontWeight: FontWeight.w600,
      ),
      side: BorderSide(color: Theme.of(context).dividerColor),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({
    required this.project,
    required this.lang,
    required this.l10n,
  });

  final Project project;
  final String lang;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return HoverCard(
      padding: EdgeInsets.zero,
      semanticLabel: project.name.resolve(lang),
      onTap: () => _openDetails(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: SafeImage(
                asset: project.imageAsset,
                fit: BoxFit.cover,
                fallbackIcon: Icons.devices_other_outlined,
                label: project.name.resolve(lang),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    if (project.featured)
                      StatusChip(label: l10n.featuredBadge, tone: ChipTone.accent),
                    if (project.isPlaceholder)
                      StatusChip(label: l10n.placeholderBadge, tone: ChipTone.warn),
                  ],
                ),
                const SizedBox(height: 12),
                Text(project.name.resolve(lang), style: theme.textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(
                  project.description.resolve(lang),
                  style: theme.textTheme.bodySmall,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 14),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    for (final tech in project.technologies.take(5))
                      TechChip(label: tech),
                  ],
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    if (project.hasDemo)
                      OutlinedButton(
                        onPressed: () => openExternal(project.demoUrl!),
                        child: Text(l10n.actionDemo),
                      ),
                    if (project.hasGithub)
                      OutlinedButton(
                        onPressed: () => openExternal(project.githubUrl!),
                        child: Text(l10n.actionGithub),
                      ),
                    if (project.hasPlay)
                      OutlinedButton(
                        onPressed: () => openExternal(project.playStoreUrl!),
                        child: Text(l10n.actionPlay),
                      ),
                    if (project.hasAppStore)
                      OutlinedButton(
                        onPressed: () => openExternal(project.appStoreUrl!),
                        child: Text(l10n.actionAppStore),
                      ),
                    TextButton(
                      onPressed: () => _openDetails(context),
                      child: Text(l10n.actionView),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _openDetails(BuildContext context) {
    final isPhone = MediaQuery.sizeOf(context).width < 720;
    showDialog<void>(
      context: context,
      builder: (ctx) {
        final pad = MediaQuery.paddingOf(ctx);
        return Dialog(
          insetPadding: isPhone
              ? EdgeInsets.fromLTRB(8, pad.top + 8, 8, pad.bottom + 8)
              : const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 720,
              maxHeight: isPhone ? MediaQuery.sizeOf(ctx).height * 0.94 : 720,
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                isPhone ? 16 : 28,
                isPhone ? 12 : 28,
                isPhone ? 16 : 28,
                isPhone ? 24 : 28,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          project.name.resolve(lang),
                          style: Theme.of(ctx).textTheme.headlineMedium,
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(ctx),
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: SafeImage(
                        asset: project.imageAsset,
                        fit: BoxFit.cover,
                        fallbackIcon: Icons.devices_other_outlined,
                        label: project.name.resolve(lang),
                      ),
                    ),
                  ),
                  if (project.screenshots.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    SizedBox(
                      height: isPhone ? 168 : 132,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: project.screenshots.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 10),
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              width: isPhone ? 98 : 200,
                              child: SafeImage(
                                asset: project.screenshots[index],
                                width: isPhone ? 98 : 200,
                                fit: BoxFit.cover,
                                fallbackIcon: Icons.photo_outlined,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                  const SizedBox(height: 16),
                  Text(project.description.resolve(lang)),
                  const SizedBox(height: 16),
                  Text(l10n.projectTech, style: Theme.of(ctx).textTheme.titleSmall),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      for (final t in project.technologies) TechChip(label: t),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(l10n.projectFeatures, style: Theme.of(ctx).textTheme.titleSmall),
                  const SizedBox(height: 8),
                  for (final f in project.features.resolve(lang))
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text('• $f'),
                    ),
                  const SizedBox(height: 12),
                  Text(
                    l10n.projectResponsibilities,
                    style: Theme.of(ctx).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 8),
                  for (final r in project.responsibilities.resolve(lang))
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text('• $r'),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
