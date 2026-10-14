import 'package:flutter/material.dart';
import 'package:portfolio/generated/app_localizations.dart';

import '../app/app_settings.dart';
import '../theme/app_colors.dart';
import '../utils/breakpoints.dart';

class NavItem {
  const NavItem(this.id, this.labelBuilder);
  final String id;
  final String Function(AppLocalizations) labelBuilder;
}

final navItems = <NavItem>[
  NavItem('home', (l) => l.navHome),
  NavItem('about', (l) => l.navAbout),
  NavItem('skills', (l) => l.navSkills),
  NavItem('expertise', (l) => l.navExpertise),
  NavItem('experience', (l) => l.navExperience),
  NavItem('education', (l) => l.educationTitle),
  NavItem('credentials', (l) => l.navCredentials),
  NavItem('projects', (l) => l.navProjects),
  NavItem('certifications', (l) => l.navCertifications),
  NavItem('awards', (l) => l.navAwards),
  NavItem('appreciations', (l) => l.navAppreciations),
  NavItem('applications', (l) => l.navApplications),
  NavItem('documents', (l) => l.navDocuments),
  NavItem('contact', (l) => l.navContact),
];

const primaryNavIds = [
  'about',
  'skills',
  'experience',
  'projects',
  'awards',
  'contact',
];

const extraNavIds = [
  'expertise',
  'education',
  'credentials',
  'certifications',
  'appreciations',
  'documents',
];

class SiteNav extends StatelessWidget {
  const SiteNav({
    super.key,
    required this.scrolled,
    required this.currentId,
    required this.onSelect,
  });

  final bool scrolled;
  final String currentId;
  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final settings = AppSettingsScope.of(context);
    final compact = !Breakpoints.isDesktop(context);
    return Semantics(
      container: true,
      header: true,
      label: l10n.appTitle,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        decoration: BoxDecoration(
          color: AppColors.navy.withOpacity(scrolled ? 0.94 : 0.62),
          border: Border(
            bottom: BorderSide(
              color: AppColors.accent.withOpacity(scrolled ? 0.4 : 0.16),
            ),
          ),
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints:
                const BoxConstraints(maxWidth: Breakpoints.content + 64),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: compact ? 16 : 24,
                vertical: 10,
              ),
              child: Row(
                children: [
                  _Brand(onTap: () => onSelect('home')),
                  if (!compact) ...[
                    const SizedBox(width: 8),
                    Flexible(
                      child: Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (final item in navItems.where(
                                (n) => primaryNavIds.contains(n.id),
                              ))
                                _NavLink(
                                  label: item.labelBuilder(l10n),
                                  selected: currentId == item.id,
                                  onPressed: () => onSelect(item.id),
                                ),
                              _MoreMenu(
                                l10n: l10n,
                                currentId: currentId,
                                onSelect: onSelect,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ] else
                    const Spacer(),
                  const SizedBox(width: 8),
                  _LangSwitch(settings: settings, l10n: l10n),
                  _ThemeSwitch(settings: settings, l10n: l10n),
                  if (compact)
                    IconButton(
                      tooltip: l10n.menuOpen,
                      onPressed: () => _openDrawer(context, l10n, onSelect),
                      icon: const Icon(Icons.menu),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _openDrawer(
    BuildContext context,
    AppLocalizations l10n,
    ValueChanged<String> onSelect,
  ) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (ctx) {
        return SafeArea(
          child: ListView(
            shrinkWrap: true,
            children: [
              _sheetHeader(l10n.navAbout),
              _sheetItem(ctx, l10n, onSelect, 'about'),
              _sheetItem(ctx, l10n, onSelect, 'skills'),
              _sheetItem(ctx, l10n, onSelect, 'expertise'),
              _sheetHeader(l10n.navExperience),
              _sheetItem(ctx, l10n, onSelect, 'experience'),
              _sheetItem(ctx, l10n, onSelect, 'education'),
              _sheetItem(ctx, l10n, onSelect, 'credentials'),
              _sheetItem(ctx, l10n, onSelect, 'projects'),
              _sheetHeader(l10n.navAwards),
              _sheetItem(ctx, l10n, onSelect, 'awards'),
              _sheetItem(ctx, l10n, onSelect, 'certifications'),
              _sheetItem(ctx, l10n, onSelect, 'appreciations'),
              _sheetHeader(l10n.navDocuments),
              _sheetItem(ctx, l10n, onSelect, 'applications'),
              _sheetItem(ctx, l10n, onSelect, 'documents'),
              _sheetItem(ctx, l10n, onSelect, 'contact'),
            ],
          ),
        );
      },
    );
  }

  Widget _sheetHeader(String label) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 4),
      child: Text(
        label.toUpperCase(),
        style: const TextStyle(
          color: AppColors.accent,
          fontSize: 11,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.4,
        ),
      ),
    );
  }

  Widget _sheetItem(
    BuildContext ctx,
    AppLocalizations l10n,
    ValueChanged<String> onSelect,
    String id,
  ) {
    final item = navItems.firstWhere((n) => n.id == id);
    return ListTile(
      title: Text(item.labelBuilder(l10n)),
      selected: currentId == id,
      onTap: () {
        Navigator.pop(ctx);
        onSelect(id);
      },
    );
  }
}

class _Brand extends StatelessWidget {
  const _Brand({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Abdul Rehman',
      child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.blueBright, AppColors.accent],
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accent.withOpacity(0.28),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const ExcludeSemantics(
                child: Text(
                  'AR',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 140),
              child: Text(
                'Abdul Rehman',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}

class _NavLink extends StatelessWidget {
  const _NavLink({
    required this.label,
    required this.selected,
    required this.onPressed,
  });

  final String label;
  final bool selected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Semantics(
      selected: selected,
      child: TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor:
            selected ? AppColors.blueBright : theme.colorScheme.onSurface,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: theme.textTheme.labelLarge?.copyWith(
              fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            height: 2,
            width: selected ? 18 : 0,
            color: AppColors.accent,
          ),
        ],
      ),
    ),
    );
  }
}

class _LangSwitch extends StatelessWidget {
  const _LangSwitch({required this.settings, required this.l10n});
  final AppSettings settings;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final isAr = settings.isArabic;
    return Tooltip(
      message: '${l10n.langEnglish} | ${l10n.langArabic}',
      child: TextButton(
        onPressed: settings.toggleLocale,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          minimumSize: const Size(48, 40),
        ),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: l10n.langEnglish,
                style: TextStyle(
                  fontWeight: isAr ? FontWeight.w400 : FontWeight.w700,
                  color: isAr
                      ? Theme.of(context).textTheme.bodySmall?.color
                      : AppColors.blueBright,
                ),
              ),
              const TextSpan(text: ' | '),
              TextSpan(
                text: l10n.langArabic,
                style: TextStyle(
                  fontFamily: 'NotoSansArabic',
                  fontWeight: isAr ? FontWeight.w700 : FontWeight.w400,
                  color: isAr
                      ? AppColors.blueBright
                      : Theme.of(context).textTheme.bodySmall?.color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ThemeSwitch extends StatelessWidget {
  const _ThemeSwitch({required this.settings, required this.l10n});
  final AppSettings settings;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final (icon, label) = switch (settings.themeMode) {
      ThemeMode.light => (Icons.light_mode_outlined, l10n.themeLight),
      ThemeMode.dark => (Icons.dark_mode_outlined, l10n.themeDark),
      ThemeMode.system => (Icons.contrast, l10n.themeSystem),
    };
    return IconButton(
      tooltip: label,
      onPressed: settings.cycleTheme,
      icon: Icon(icon, size: 20),
    );
  }
}

class _MoreMenu extends StatelessWidget {
  const _MoreMenu({
    required this.l10n,
    required this.currentId,
    required this.onSelect,
  });

  final AppLocalizations l10n;
  final String currentId;
  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      tooltip: l10n.navMore,
      onSelected: onSelect,
      offset: const Offset(0, 40),
      itemBuilder: (context) => [
        for (final item in navItems.where((n) => extraNavIds.contains(n.id)))
          PopupMenuItem(
            value: item.id,
            child: Text(item.labelBuilder(l10n)),
          ),
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.navMore,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: extraNavIds.contains(currentId)
                        ? FontWeight.w700
                        : FontWeight.w500,
                    color: extraNavIds.contains(currentId)
                        ? AppColors.blueBright
                        : null,
                  ),
            ),
            const Icon(Icons.expand_more, size: 16),
          ],
        ),
      ),
    );
  }
}
