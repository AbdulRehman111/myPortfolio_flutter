import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/generated/app_localizations.dart';

import '../sections/about_section.dart';
import '../sections/applications_section.dart';
import '../sections/appreciations_section.dart';
import '../sections/architecture_section.dart';
import '../sections/awards_section.dart';
import '../sections/certifications_section.dart';
import '../sections/contact_section.dart';
import '../sections/cv_section.dart';
import '../sections/education_section.dart';
import '../sections/experience_section.dart';
import '../sections/expertise_section.dart';
import '../sections/footer_section.dart';
import '../sections/hero_section.dart';
import '../sections/projects_section.dart';
import '../sections/qr_section.dart';
import '../sections/skills_section.dart';
import '../widgets/site_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final _scroll = ScrollController();
  final _sectionKeys = <String, GlobalKey>{
    for (final item in navItems) item.id: GlobalKey(),
  };
  String _current = 'home';
  bool _scrolled = false;
  bool _showFab = false;

  late AnimationController _fabController;
  late Animation<double> _fabScale;

  @override
  void initState() {
    super.initState();
    _scroll.addListener(_onScroll);

    _fabController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _fabScale = CurvedAnimation(
      parent: _fabController,
      curve: Curves.easeOutBack,
    );
  }

  @override
  void dispose() {
    _scroll.removeListener(_onScroll);
    _scroll.dispose();
    _fabController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final offset = _scroll.offset;

    // Nav bar elevation
    final scrolled = offset > 8;
    if (scrolled != _scrolled) {
      setState(() => _scrolled = scrolled);
    }

    // FAB visibility
    final showFab = offset > 400;
    if (showFab != _showFab) {
      _showFab = showFab;
      if (_showFab) {
        _fabController.forward();
      } else {
        _fabController.reverse();
      }
    }

    // Active section tracking
    String current = 'home';
    for (final entry in _sectionKeys.entries) {
      final ctx = entry.value.currentContext;
      if (ctx == null) continue;
      final box = ctx.findRenderObject() as RenderBox?;
      if (box == null || !box.hasSize) continue;
      final y = box.localToGlobal(Offset.zero).dy;
      if (y <= 140) current = entry.key;
    }
    if (current != _current) {
      setState(() => _current = current);
    }
  }

  Future<void> _goTo(String id) async {
    HapticFeedback.selectionClick();
    final key = _sectionKeys[id];
    final ctx = key?.currentContext;
    if (ctx == null) return;
    await Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 520),
      curve: Curves.easeInOutCubic,
      alignment: 0.08,
    );
  }

  void _scrollToTop() {
    HapticFeedback.lightImpact();
    _scroll.animateTo(
      0,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    Widget section(String id, Widget child) {
      return KeyedSubtree(key: _sectionKeys[id], child: child);
    }

    return Scaffold(
      body: CallbackShortcuts(
        bindings: {
          const SingleActivator(LogicalKeyboardKey.home): _scrollToTop,
        },
        child: Focus(
          autofocus: true,
          child: Column(
            children: [
              SiteNav(
                scrolled: _scrolled,
                currentId: _current,
                onSelect: _goTo,
              ),
              Expanded(
                child: Stack(
                  children: [
                    /// ── Main scroll content ──
                    CustomScrollView(
                      controller: _scroll,
                      physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      slivers: [
                        SliverToBoxAdapter(
                          child: Semantics(
                            label: l10n.skipToContent,
                            child: Column(
                              children: [
                                section('home', HeroSection(onNavigate: _goTo)),
                                section('about', const AboutSection()),
                                section('skills', const SkillsSection()),
                                section('expertise', const ExpertiseSection()),
                                const ArchitectureSection(),
                                section(
                                    'experience', const ExperienceSection()),
                                section('projects', const ProjectsSection()),
                                section('certifications',
                                    const CertificationsSection()),
                                section('awards', const AwardsSection()),
                                section('appreciations',
                                    const AppreciationsSection()),
                                const EducationSection(),
                                section('applications',
                                    const ApplicationsSection()),
                                const QrSection(),
                                const CvSection(),
                                section('contact', const ContactSection()),
                                const FooterSection(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    /// ── Scroll-to-top FAB ──
                    Positioned(
                      bottom: 24,
                      right: 24,
                      child: ScaleTransition(
                        scale: _fabScale,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: scheme.primary
                                    .withOpacity(isDark ? 0.3 : 0.25),
                                blurRadius: 16,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: FloatingActionButton.small(
                            onPressed: _scrollToTop,
                            backgroundColor: scheme.primary,
                            foregroundColor: scheme.onPrimary,
                            elevation: 0,
                            hoverElevation: 2,
                            shape: const CircleBorder(),
                            tooltip: 'Back to top',
                            child: const Icon(
                              Icons.keyboard_arrow_up_rounded,
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
