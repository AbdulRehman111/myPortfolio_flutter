import 'package:flutter/material.dart';
import 'package:portfolio/generated/app_localizations.dart';

import '../app/app_settings.dart';
import '../data/portfolio_data.dart';
import '../theme/app_colors.dart';
import '../utils/breakpoints.dart';
import '../utils/launch_helper.dart';

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
  NavItem('projects', (l) => l.navProjects),
  NavItem('certifications', (l) => l.navCertifications),
  NavItem('awards', (l) => l.navAwards),
  NavItem('applications', (l) => l.navApplications),
  NavItem('contact', (l) => l.navContact),
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
    final theme = Theme.of(context);
    final mobile = Breakpoints.isMobile(context);
    final surface = theme.colorScheme.surface.withOpacity(scrolled ? 0.94 : 0.72);

    return Semantics(
      container: true,
      header: true,
      label: l10n.appTitle,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: surface,
          border: Border(
            bottom: BorderSide(
              color: theme.dividerColor.withOpacity(scrolled ? 1 : 0.4),
            ),
          ),
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: Breakpoints.content + 64),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: mobile ? 16 : 24,
                vertical: 10,
              ),
              child: Row(
                children: [
                  _Brand(onTap: () => onSelect('home')),
                  const Spacer(),
                  if (!mobile)
                    Flexible(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (final item in navItems)
                              _NavLink(
                                label: item.labelBuilder(l10n),
                                selected: currentId == item.id,
                                onPressed: () => onSelect(item.id),
                              ),
                          ],
                        ),
                      ),
                    ),
                  const SizedBox(width: 8),
                  _LangSwitch(settings: settings, l10n: l10n),
                  _ThemeSwitch(settings: settings, l10n: l10n),
                  IconButton(
                    tooltip: l10n.navLinkedIn,
                    onPressed: () => openExternal(PortfolioData.linkedInUrl),
                    icon: const Icon(Icons.business_center_outlined, size: 20),
                  ),
                  if (mobile)
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
              for (final item in navItems)
                ListTile(
                  title: Text(item.labelBuilder(l10n)),
                  selected: currentId == item.id,
                  onTap: () {
                    Navigator.pop(ctx);
                    onSelect(item.id);
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}

class _Brand extends StatelessWidget {
  const _Brand({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'AR',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              'Abdul Rehman',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
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
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: selected ? AppColors.blueBright : theme.colorScheme.onSurface,
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
                  color: isAr ? Theme.of(context).textTheme.bodySmall?.color : AppColors.blueBright,
                ),
              ),
              const TextSpan(text: ' | '),
              TextSpan(
                text: l10n.langArabic,
                style: TextStyle(
                  fontFamily: 'NotoSansArabic',
                  fontWeight: isAr ? FontWeight.w700 : FontWeight.w400,
                  color: isAr ? AppColors.blueBright : Theme.of(context).textTheme.bodySmall?.color,
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
