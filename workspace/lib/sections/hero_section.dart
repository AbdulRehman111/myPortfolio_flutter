import 'package:flutter/material.dart';
import 'package:portfolio/generated/app_localizations.dart';

import '../data/portfolio_data.dart';
import '../theme/app_colors.dart';
import '../utils/breakpoints.dart';
import '../utils/launch_helper.dart';
import '../widgets/fade_in.dart';
import '../widgets/section_shell.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.onNavigate});

  final ValueChanged<String> onNavigate;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final mobile = Breakpoints.isMobile(context);
    final profile = PortfolioData.profile;
    final isDark = theme.brightness == Brightness.dark;

    final copy = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.heroYears.toUpperCase(),
          style: theme.textTheme.labelLarge?.copyWith(
            color: AppColors.accent,
            letterSpacing: 1.4,
          ),
        ),
        const SizedBox(height: 16),
        Text(l10n.heroName, style: theme.textTheme.displayMedium),
        const SizedBox(height: 14),
        Text(
          l10n.heroHeadline,
          style: theme.textTheme.titleLarge?.copyWith(
            color: AppColors.blueBright,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 18),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: Text(l10n.heroTagline, style: theme.textTheme.bodyLarge),
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            ElevatedButton(
              onPressed: () => onNavigate('projects'),
              child: Text(l10n.ctaViewWork),
            ),
            OutlinedButton(
              onPressed: () => onNavigate('about'),
              child: Text(l10n.ctaAbout),
            ),
            OutlinedButton(
              onPressed: () => openExternal(profile.cvAsset),
              child: Text(l10n.ctaDownloadCv),
            ),
            OutlinedButton(
              onPressed: () => onNavigate('contact'),
              child: Text(l10n.ctaContact),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final social in profile.visibleSocial)
              IconButton.outlined(
                tooltip: social.label,
                onPressed: () => openExternal(social.url),
                icon: Icon(social.icon, size: 20),
              ),
          ],
        ),
      ],
    );

    return SectionShell(
      id: 'home',
      padding: EdgeInsets.fromLTRB(
        mobile ? 20 : 32,
        mobile ? 48 : 80,
        mobile ? 20 : 32,
        mobile ? 56 : 88,
      ),
      child: FadeIn(
        child: mobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  copy,
                  const SizedBox(height: 40),
                  Center(
                    child: _Portrait(
                      image: profile.profileImage,
                      isDark: isDark,
                      compact: true,
                    ),
                  ),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 3, child: copy),
                  const SizedBox(width: 48),
                  _Portrait(
                    image: profile.profileImage,
                    isDark: isDark,
                    compact: false,
                  ),
                ],
              ),
      ),
    );
  }
}

class _Portrait extends StatelessWidget {
  const _Portrait({
    required this.image,
    required this.isDark,
    required this.compact,
  });

  final String image;
  final bool isDark;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final size = compact ? 220.0 : 320.0;
    return Semantics(
      image: true,
      label: 'Abdul Rehman',
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 28,
              offset: const Offset(0, 14),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Image.asset(image, fit: BoxFit.cover),
      ),
    );
  }
}
