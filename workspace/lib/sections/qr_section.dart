import 'package:flutter/material.dart';
import 'package:portfolio/generated/app_localizations.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../data/portfolio_data.dart';
import '../theme/app_colors.dart';
import '../utils/launch_helper.dart';
import '../widgets/section_shell.dart';

class QrSection extends StatelessWidget {
  const QrSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final dest = PortfolioData.profile.qrDestination;

    return SectionShell(
      id: 'qr',
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 36),
        decoration: BoxDecoration(
          color: AppColors.navy,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Wrap(
          spacing: 36,
          runSpacing: 24,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.qrEyebrow.toUpperCase(),
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: AppColors.accent,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 12),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 460),
                  child: Text(
                    l10n.qrTitle,
                    style: theme.textTheme.headlineMedium?.copyWith(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 460),
                  child: Text(
                    l10n.qrLead,
                    style: theme.textTheme.bodyMedium?.copyWith(color: const Color(0xFFD5DEEA)),
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    ElevatedButton(
                      onPressed: () => openExternal(dest),
                      child: Text(l10n.qrOpen),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Color(0xFF4A6280)),
                      ),
                      onPressed: () => openExternal(dest),
                      child: Text(l10n.qrDownload),
                    ),
                  ],
                ),
              ],
            ),
            Semantics(
              label: l10n.qrTitle,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: QrImageView(
                  data: dest,
                  size: 180,
                  backgroundColor: Colors.white,
                  eyeStyle: const QrEyeStyle(
                    eyeShape: QrEyeShape.square,
                    color: AppColors.navy,
                  ),
                  dataModuleStyle: const QrDataModuleStyle(
                    dataModuleShape: QrDataModuleShape.square,
                    color: AppColors.navy,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
