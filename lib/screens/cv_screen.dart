import 'package:flutter/material.dart';
import 'package:portfolio/generated/app_localizations.dart';

import '../data/portfolio_data.dart';
import '../theme/app_colors.dart';
import '../utils/breakpoints.dart';
import '../utils/launch_helper.dart';
import '../widgets/status_chip.dart';

class CvScreen extends StatelessWidget {
  const CvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final lang = Localizations.localeOf(context).languageCode;
    final mobile = Breakpoints.isMobile(context);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFE8EDF3),
      appBar: AppBar(
        backgroundColor: AppColors.navy,
        foregroundColor: Colors.white,
        title: Text(l10n.cvTitle),
        actions: [
          TextButton.icon(
            onPressed: () => openExternal('cv.pdf'),
            icon: const Icon(Icons.download_outlined, color: Colors.white, size: 18),
            label: Text(l10n.ctaDownloadCv, style: const TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 980),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: mobile ? 12 : 24, vertical: 24),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 40,
                    offset: const Offset(0, 18),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(
                        mobile ? 22 : 40,
                        36,
                        mobile ? 22 : 40,
                        32,
                      ),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF071525), Color(0xFF123056), Color(0xFF1E4E79)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: mobile
                          ? Column(
                              children: [
                                _photo(92),
                                const SizedBox(height: 16),
                                _heroCopy(l10n, true),
                              ],
                            )
                          : Row(
                              children: [
                                _photo(118),
                                const SizedBox(width: 28),
                                Expanded(child: _heroCopy(l10n, false)),
                              ],
                            ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(mobile ? 20 : 36),
                      child: mobile
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _mainColumn(context, lang, l10n, theme),
                                const SizedBox(height: 28),
                                _sideColumn(context, lang, l10n, theme),
                              ],
                            )
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 11,
                                  child: _mainColumn(context, lang, l10n, theme),
                                ),
                                const SizedBox(width: 32),
                                Expanded(
                                  flex: 7,
                                  child: _sideColumn(context, lang, l10n, theme),
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _photo(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.accent, width: 2),
        image: DecorationImage(
          image: AssetImage(PortfolioData.profile.profileImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _heroCopy(AppLocalizations l10n, bool center) {
    final align = center ? TextAlign.center : TextAlign.start;
    return Column(
      crossAxisAlignment: center ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          l10n.cvEyebrow.toUpperCase(),
          textAlign: align,
          style: const TextStyle(
            color: AppColors.accent,
            letterSpacing: 3,
            fontSize: 11,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          l10n.heroName,
          textAlign: align,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 34,
            fontWeight: FontWeight.w700,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          l10n.heroHeadline,
          textAlign: align,
          style: const TextStyle(color: Color(0xFFC9D7E8), height: 1.4),
        ),
        const SizedBox(height: 16),
        Wrap(
          alignment: center ? WrapAlignment.center : WrapAlignment.start,
          spacing: 10,
          runSpacing: 8,
          children: [
            _metaChip(Icons.place_outlined, PortfolioData.profile.contact.location),
            _metaChip(Icons.mail_outline, PortfolioData.email),
            _metaChip(Icons.code, 'github.com/AbdulRehman111'),
          ],
        ),
      ],
    );
  }

  Widget _metaChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppColors.accent),
          const SizedBox(width: 6),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _heading(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          color: AppColors.blue,
          letterSpacing: 1.8,
          fontSize: 12,
          fontWeight: FontWeight.w700,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.accent,
          decorationThickness: 2,
        ),
      ),
    );
  }

  Widget _mainColumn(
    BuildContext context,
    String lang,
    AppLocalizations l10n,
    ThemeData theme,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _heading(l10n.aboutEyebrow),
        Text(l10n.aboutP1, style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.lightText)),
        const SizedBox(height: 12),
        Text(l10n.aboutP2, style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.lightText)),
        const SizedBox(height: 12),
        Text(l10n.aboutP6, style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.lightText)),
        const SizedBox(height: 28),
        _heading(l10n.experienceTitle),
        for (final item in PortfolioData.experience) ...[
          Text(item.position.resolve(lang), style: theme.textTheme.titleMedium?.copyWith(color: AppColors.navy)),
          Text(item.company.resolve(lang), style: const TextStyle(color: AppColors.blueBright, fontWeight: FontWeight.w600)),
          Text(item.dates.resolve(lang), style: theme.textTheme.bodySmall),
          const SizedBox(height: 8),
          Text(item.description.resolve(lang), style: theme.textTheme.bodySmall?.copyWith(color: AppColors.lightText, height: 1.55)),
          const SizedBox(height: 8),
          for (final r in item.responsibilities.resolve(lang).take(5))
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('•  ', style: TextStyle(color: AppColors.accent)),
                  Expanded(child: Text(r, style: theme.textTheme.bodySmall?.copyWith(color: AppColors.lightText))),
                ],
              ),
            ),
          const SizedBox(height: 18),
        ],
        _heading(l10n.projectsTitle),
        for (final p in PortfolioData.projects.where((e) => e.featured))
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(p.name.resolve(lang), style: theme.textTheme.titleSmall?.copyWith(color: AppColors.navy)),
                Text(p.description.resolve(lang), style: theme.textTheme.bodySmall?.copyWith(color: AppColors.lightText)),
              ],
            ),
          ),
      ],
    );
  }

  Widget _sideColumn(
    BuildContext context,
    String lang,
    AppLocalizations l10n,
    ThemeData theme,
  ) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F4EE),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE4D9C5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _heading(l10n.skillsTitle),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              for (final skill in [
                'Flutter',
                'Dart',
                'ASP.NET',
                'C#',
                'SQL Server',
                'REST',
                'Firebase',
                'JWT',
                'React',
                'Maps',
                'RTL/LTR',
              ])
                TechChip(label: skill),
            ],
          ),
          const SizedBox(height: 22),
          _heading(l10n.educationTitle),
          for (final item in PortfolioData.education) ...[
            Text(item.degree.resolve(lang), style: theme.textTheme.titleSmall?.copyWith(color: AppColors.navy)),
            Text(item.institution.resolve(lang), style: theme.textTheme.bodySmall),
            Text(item.dates.resolve(lang), style: theme.textTheme.bodySmall),
            const SizedBox(height: 12),
          ],
          _heading(l10n.awardsTitle),
          for (final a in PortfolioData.awards.take(3))
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                '${a.title.resolve(lang)} — ${a.date.resolve(lang)}',
                style: theme.textTheme.bodySmall?.copyWith(color: AppColors.lightText),
              ),
            ),
          const SizedBox(height: 8),
          _heading(l10n.contactTitle),
          TextButton(
            onPressed: () => openExternal(PortfolioData.linkedInUrl),
            child: const Text('LinkedIn'),
          ),
          TextButton(
            onPressed: () => openExternal(PortfolioData.githubUrl),
            child: const Text('GitHub'),
          ),
          TextButton(
            onPressed: () => openMail(PortfolioData.email),
            child: const Text('Email'),
          ),
        ],
      ),
    );
  }
}
