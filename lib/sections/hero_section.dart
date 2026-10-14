import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/generated/app_localizations.dart';

import '../data/portfolio_data.dart';
import '../theme/app_colors.dart';
import '../utils/breakpoints.dart';
import '../utils/launch_helper.dart';
import '../screens/cv_screen.dart';
import '../widgets/fade_in.dart';
import '../widgets/safe_image.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.onNavigate});

  final ValueChanged<String> onNavigate;

  String _uaeGreeting(AppLocalizations l10n) {
    final hour = DateTime.now().toUtc().add(const Duration(hours: 4)).hour;
    if (hour < 12) return l10n.greetMorn;
    if (hour < 17) return l10n.greetAft;
    return l10n.greetEve;
  }

  String _vcard() {
    return [
      'BEGIN:VCARD',
      'VERSION:3.0',
      'N:Rehman;Abdul;;;',
      'FN:Abdul Rehman',
      'TITLE:Software Engineer',
      'ORG:Fujairah Municipality',
      'EMAIL:${PortfolioData.email}',
      'URL:${PortfolioData.linkedInUrl}',
      'ADR:;;Fujairah;;;United Arab Emirates',
      'END:VCARD',
    ].join('\n');
  }

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
        FadeIn(
          child: Text(
            _uaeGreeting(l10n),
            style: theme.textTheme.labelLarge?.copyWith(
              color: AppColors.accent,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 10),
        FadeIn(
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: AppColors.accent.withOpacity(0.45)),
                  color: AppColors.accent.withOpacity(0.12),
                ),
                child: Text(
                  l10n.heroYears.toUpperCase(),
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: AppColors.accent,
                    letterSpacing: 1.4,
                    fontSize: mobile ? 10 : 12,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: const Color(0xFF6BD4A0).withOpacity(0.4)),
                  color: const Color(0xFF6BD4A0).withOpacity(0.12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 7,
                      height: 7,
                      decoration: const BoxDecoration(
                        color: Color(0xFF6BD4A0),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Available for work',
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: const Color(0xFF6BD4A0),
                        letterSpacing: 0.4,
                        fontSize: mobile ? 10 : 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        FadeIn(
          delay: const Duration(milliseconds: 80),
          child: Text(
            l10n.heroName,
            style: (mobile
                    ? theme.textTheme.displayMedium?.copyWith(fontSize: 36)
                    : theme.textTheme.displayLarge)
                ?.copyWith(
              color: Colors.white,
              letterSpacing: -1.2,
              height: 1.05,
            ),
          ),
        ),
        const SizedBox(height: 14),
        FadeIn(
          delay: const Duration(milliseconds: 140),
          child: Text(
            l10n.heroHeadline,
            style: theme.textTheme.titleLarge?.copyWith(
              color: const Color(0xFF8EC5FF),
              height: 1.4,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 18),
        FadeIn(
          delay: const Duration(milliseconds: 200),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: Text(
              l10n.heroTagline,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: const Color(0xFFC9D7E8),
              ),
            ),
          ),
        ),
        const SizedBox(height: 28),
        FadeIn(
          delay: const Duration(milliseconds: 260),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              ElevatedButton.icon(
                onPressed: () => onNavigate('projects'),
                icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                label: Text(l10n.ctaViewWork),
              ),
              ElevatedButton(
                onPressed: () => onNavigate('contact'),
                child: Text(l10n.ctaHire),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Color(0x66FFFFFF)),
                ),
                onPressed: () => onNavigate('contact'),
                child: Text(l10n.ctaContact),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Color(0x66FFFFFF)),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const CvScreen()),
                  );
                },
                child: Text(l10n.ctaOpenCv),
              ),
              if (!mobile)
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Color(0x66FFFFFF)),
                  ),
                  onPressed: () => openExternal('cv.pdf'),
                  child: Text(l10n.ctaDownloadCv),
                ),
            ],
          ),
        ),
        const SizedBox(height: 28),
        FadeIn(
          delay: const Duration(milliseconds: 300),
          child: Wrap(
            spacing: 18,
            runSpacing: 14,
            children: const [
              _HeroStat(value: '9+', label: 'Years'),
              _HeroStat(value: 'Full stack', label: 'Mobile · Web · API'),
              _HeroStat(value: 'GIS', label: 'Maps · KML · RTL'),
              _HeroStat(value: 'Store', label: 'iOS · Android'),
            ],
          ),
        ),
        const SizedBox(height: 24),
        FadeIn(
          delay: const Duration(milliseconds: 320),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final social in profile.visibleSocial)
                IconButton.outlined(
                  tooltip: social.label,
                  style: IconButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Color(0x44FFFFFF)),
                  ),
                  onPressed: () => openExternal(social.url),
                  icon: Icon(social.icon, size: 20),
                ),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Color(0x44FFFFFF)),
                ),
                onPressed: () async {
                  await Clipboard.setData(
                    const ClipboardData(text: PortfolioData.email),
                  );
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(l10n.emailCopied)),
                  );
                },
                icon: const Icon(Icons.copy_rounded, size: 16),
                label: Text(l10n.copyEmail),
              ),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Color(0x44FFFFFF)),
                ),
                onPressed: () async {
                  await Clipboard.setData(ClipboardData(text: _vcard()));
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(l10n.vcardCopied)),
                  );
                },
                icon: const Icon(Icons.contact_page_outlined, size: 16),
                label: Text(l10n.saveContact),
              ),
            ],
          ),
        ),
      ],
    );

    return ColoredBox(
      color: isDark ? AppColors.darkBg : AppColors.navy,
      child: Stack(
        children: [
          const Positioned.fill(child: _HeroAtmosphere()),
          Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: Breakpoints.content),
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  mobile ? 20 : 32,
                  mobile ? 48 : 80,
                  mobile ? 20 : 32,
                  mobile ? 56 : 88,
                ),
                child: mobile
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: _Portrait(
                              image: profile.profileImage,
                              isDark: isDark,
                              compact: true,
                            ),
                          ),
                          const SizedBox(height: 32),
                          copy,
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
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroAtmosphere extends StatefulWidget {
  const _HeroAtmosphere();

  @override
  State<_HeroAtmosphere> createState() => _HeroAtmosphereState();
}

class _HeroAtmosphereState extends State<_HeroAtmosphere>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 14),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final t = _controller.value * math.pi * 2;
        return DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(math.sin(t) * 0.35, -0.55 + math.cos(t) * 0.12),
              radius: 1.15,
              colors: const [
                Color(0xFF1E4E79),
                Color(0xFF0B1D36),
                Color(0xFF071525),
              ],
              stops: const [0, 0.45, 1],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                right: -80 + math.cos(t) * 24,
                top: -40 + math.sin(t) * 18,
                child: Container(
                  width: 280,
                  height: 280,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.accent.withOpacity(0.18),
                      width: 22,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: -60,
                bottom: 40,
                child: Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.blueBright.withOpacity(0.08),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Portrait extends StatefulWidget {
  const _Portrait({
    required this.image,
    required this.isDark,
    required this.compact,
  });

  final String image;
  final bool isDark;
  final bool compact;

  @override
  State<_Portrait> createState() => _PortraitState();
}

class _PortraitState extends State<_Portrait>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = widget.compact ? 220.0 : 320.0;
    return Semantics(
      image: true,
      label: 'Abdul Rehman',
      child: AnimatedBuilder(
        animation: _pulse,
        builder: (context, child) {
          final glow = 0.18 + (_pulse.value * 0.16);
          return Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              border: Border.all(
                color: AppColors.accent.withOpacity(0.85),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.accent.withOpacity(glow),
                  blurRadius: 42,
                  spreadRadius: 2,
                ),
                BoxShadow(
                  color: AppColors.blue.withOpacity(widget.isDark ? 0.4 : 0.22),
                  blurRadius: 36,
                  offset: const Offset(0, 16),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: child,
          );
        },
        child: SafeImage(
          asset: widget.image,
          fit: BoxFit.cover,
          fallbackIcon: Icons.person_outline,
          label: 'Abdul Rehman',
        ),
      ),
    );
  }
}

class _HeroStat extends StatelessWidget {
  const _HeroStat({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 92),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 20,
              letterSpacing: -0.4,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF9BB0C7),
              fontSize: 12,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}
