import 'package:flutter/material.dart';
import 'package:portfolio/generated/app_localizations.dart';

import '../theme/app_colors.dart';
import '../widgets/section_shell.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ColoredBox(
      color: AppColors.navy,
      child: SectionShell(
        id: 'footer',
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
        child: Column(
          children: [
            Text(
              l10n.footerNote,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: const Color(0xFFB7C4D6),
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              '© ${DateTime.now().year} ${l10n.footerRights}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF8A9BB0),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
