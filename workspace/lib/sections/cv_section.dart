import 'package:flutter/material.dart';
import 'package:portfolio/generated/app_localizations.dart';

import '../data/portfolio_data.dart';
import '../theme/app_colors.dart';
import '../utils/launch_helper.dart';
import '../widgets/section_shell.dart';

class CvSection extends StatelessWidget {
  const CvSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final cv = PortfolioData.profile.cvAsset;

    return SectionShell(
      id: 'cv',
      alternate: true,
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
                      onPressed: () => openExternal(cv),
                      icon: const Icon(Icons.download_outlined, size: 18),
                      label: Text(l10n.ctaDownloadCv),
                    ),
                    OutlinedButton.icon(
                      onPressed: () => openExternal(cv),
                      icon: const Icon(Icons.visibility_outlined, size: 18),
                      label: Text(l10n.ctaViewCv),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 24),
          Container(
            width: 88,
            height: 112,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.navy,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'PDF',
              style: theme.textTheme.titleMedium?.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
