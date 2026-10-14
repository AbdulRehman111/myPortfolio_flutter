import 'package:flutter/material.dart';
import 'package:portfolio/generated/app_localizations.dart';

import '../data/portfolio_data.dart';
import '../theme/app_colors.dart';
import '../utils/launch_helper.dart';
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
              Wrap(
                spacing: 8,
                children: [
                  IconButton(
                    color: Colors.white,
                    onPressed: () => openExternal(PortfolioData.linkedInUrl),
                    icon: const Icon(Icons.business_center_outlined),
                  ),
                  IconButton(
                    color: Colors.white,
                    onPressed: () => openExternal(PortfolioData.githubUrl),
                    icon: const Icon(Icons.code),
                  ),
                  IconButton(
                    color: Colors.white,
                    onPressed: () => openMail(PortfolioData.email),
                    icon: const Icon(Icons.mail_outline),
                  ),
                ],
              ),
              IconButton(
                color: Colors.white,
                onPressed: () => openExternal(PortfolioData.githubUrl),
                icon: const Icon(Icons.code),
              ),
              IconButton(
                color: Colors.white,
                onPressed: () => openMail(PortfolioData.email),
                icon: const Icon(Icons.mail_outline),
              ),
              const SizedBox(height: 12),
              Text(
                'Abdul Rehman',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
              const SizedBox(height: 8),
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
        ));
  }
}
