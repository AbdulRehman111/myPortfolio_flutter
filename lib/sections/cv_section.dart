import 'package:flutter/material.dart';
import 'package:portfolio/generated/app_localizations.dart';

import '../data/portfolio_data.dart';
import '../screens/cv_screen.dart';
import '../theme/app_colors.dart';
import '../utils/launch_helper.dart';
import '../widgets/reveal.dart';
import '../widgets/section_shell.dart';

class CvSection extends StatelessWidget {
  const CvSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return SectionShell(
      id: 'cv',
      alternate: true,
      child: Reveal(
        child: Wrap(
          spacing: 24,
          runSpacing: 16,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionHeader(
                    eyebrow: l10n.cvEyebrow,
                    title: l10n.cvTitle,
                    lead: l10n.cvLead,
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder: (_, animation, __) => FadeTransition(
                                opacity: animation,
                                child: const CvScreen(),
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.auto_awesome_outlined, size: 18),
                        label: Text(l10n.ctaOpenCv),
                      ),
                      OutlinedButton.icon(
                        onPressed: () => openExternal('cv.pdf'),
                        icon: const Icon(Icons.download_outlined, size: 18),
                        label: Text(l10n.ctaDownloadCv),
                      ),
                      OutlinedButton.icon(
                        onPressed: () => openExternal(PortfolioData.profile.cvAsset),
                        icon: const Icon(Icons.visibility_outlined, size: 18),
                        label: Text(l10n.ctaViewCv),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 120,
              height: 152,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.navy, AppColors.blue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.navy.withOpacity(0.28),
                    blurRadius: 22,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.description_outlined, color: AppColors.accent, size: 28),
                  const SizedBox(height: 10),
                  Text(
                    'CV',
                    style: theme.textTheme.titleLarge?.copyWith(color: Colors.white),
                  ),
                  Text(
                    'HTML + PDF',
                    style: theme.textTheme.labelMedium?.copyWith(color: const Color(0xFFB7C4D6)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
