import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/generated/app_localizations.dart';

import '../sections/about_section.dart';
import '../sections/applications_section.dart';
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

class _HomeScreenState extends State<HomeScreen> {
  final _scroll = ScrollController();
  final _sectionKeys = <String, GlobalKey>{
    for (final item in navItems) item.id: GlobalKey(),
  };
  String _current = 'home';
  bool _scrolled = false;

  @override
  void initState() {
    super.initState();
    _scroll.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scroll.removeListener(_onScroll);
    _scroll.dispose();
    super.dispose();
  }

  void _onScroll() {
    final offset = _scroll.offset;
    final scrolled = offset > 8;
    if (scrolled != _scrolled) {
      setState(() => _scrolled = scrolled);
    }

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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    Widget section(String id, Widget child) {
      return KeyedSubtree(key: _sectionKeys[id], child: child);
    }

    return Scaffold(
      body: CallbackShortcuts(
        bindings: {
          const SingleActivator(LogicalKeyboardKey.home): () => _goTo('home'),
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
                child: CustomScrollView(
                  controller: _scroll,
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
                            section('experience', const ExperienceSection()),
                            section('projects', const ProjectsSection()),
                            section('certifications', const CertificationsSection()),
                            section('awards', const AwardsSection()),
                            const EducationSection(),
                            section('applications', const ApplicationsSection()),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
