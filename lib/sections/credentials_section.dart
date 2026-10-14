import 'package:flutter/material.dart';
import 'package:portfolio/generated/app_localizations.dart';

import '../app/app_settings.dart';
import '../data/portfolio_data.dart';
import '../models/academic_credential.dart';
import '../screens/document_viewer_screen.dart';
import '../theme/app_colors.dart';
import '../widgets/hover_card.dart';
import '../widgets/responsive_grid.dart';
import '../widgets/reveal.dart';
import '../widgets/section_shell.dart';
import '../widgets/status_chip.dart';

class CredentialsSection extends StatefulWidget {
  const CredentialsSection({super.key});

  @override
  State<CredentialsSection> createState() => _CredentialsSectionState();
}

class _CredentialsSectionState extends State<CredentialsSection> {
  String _filter = 'all';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final lang = AppSettingsScope.of(context).locale.languageCode;
    final theme = Theme.of(context);
    final items = PortfolioData.academicCredentials.where((c) {
      if (_filter == 'original') return !c.isUae;
      if (_filter == 'uae') return c.isUae;
      return true;
    }).toList();

    return SectionShell(
      id: 'credentials',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            eyebrow: l10n.credEyebrow,
            title: l10n.credTitle,
            lead: l10n.credLead,
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            decoration: BoxDecoration(
              color: AppColors.accent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: AppColors.accent.withOpacity(0.4)),
            ),
            child: Text(
              l10n.credRibbon,
              style: theme.textTheme.labelSmall?.copyWith(
                color: AppColors.accent,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _chip(l10n.filterAll, 'all'),
              _chip(l10n.credOrig, 'original'),
              _chip(l10n.credUae, 'uae'),
            ],
          ),
          const SizedBox(height: 24),
          ResponsiveGrid(
            desktopColumns: 2,
            children: [
              for (var i = 0; i < items.length; i++)
                Reveal(
                  delay: Duration(milliseconds: 60 * (i % 4)),
                  child: _CredCard(
                    item: items[i],
                    lang: lang,
                    l10n: l10n,
                    theme: theme,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _chip(String label, String value) {
    final selected = _filter == value;
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => setState(() => _filter = value),
      selectedColor: AppColors.navy,
      labelStyle: TextStyle(
        color: selected ? Colors.white : Theme.of(context).colorScheme.onSurface,
        fontWeight: FontWeight.w600,
      ),
      side: BorderSide(color: Theme.of(context).dividerColor),
    );
  }
}

class _CredCard extends StatelessWidget {
  const _CredCard({
    required this.item,
    required this.lang,
    required this.l10n,
    required this.theme,
  });

  final AcademicCredential item;
  final String lang;
  final AppLocalizations l10n;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      padding: EdgeInsets.zero,
      onTap: () => openDocument(context, item.document, lang),
      semanticLabel: item.title.resolve(lang),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 168,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: item.isUae
                    ? const [Color(0xFF102544), Color(0xFF1E4E79), Color(0xFF6BD4A0)]
                    : const [Color(0xFF102544), Color(0xFF1E4E79), Color(0xFFC4A35A)],
              ),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              border: Border(
                top: BorderSide(
                  color: item.isUae
                      ? const Color(0xFF6BD4A0).withOpacity(0.45)
                      : AppColors.accent.withOpacity(0.45),
                ),
              ),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: IgnorePointer(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.transparent,
                            Colors.white.withOpacity(0.18),
                            Colors.transparent,
                          ],
                          stops: const [0.28, 0.5, 0.72],
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    item.kind,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 2.2,
                    ),
                  ),
                ),
                PositionedDirectional(
                  top: 10,
                  start: 10,
                  child: StatusChip(label: l10n.credSample, tone: ChipTone.warn),
                ),
                PositionedDirectional(
                  end: 14,
                  bottom: 12,
                  child: Container(
                    width: 46,
                    height: 46,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        center: Alignment(-0.3, -0.4),
                        colors: [Color(0xFFF0D48A), Color(0xFFB8923F), Color(0xFF7A5A18)],
                      ),
                      boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 10)],
                    ),
                    child: Text(
                      item.isUae ? 'UAE' : 'AR',
                      style: const TextStyle(
                        color: Color(0xFF071525),
                        fontWeight: FontWeight.w800,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title.resolve(lang), style: theme.textTheme.titleSmall),
                const SizedBox(height: 6),
                Text(item.meta.resolve(lang), style: theme.textTheme.bodySmall),
                const SizedBox(height: 8),
                Text(
                  item.description.resolve(lang),
                  style: theme.textTheme.bodySmall,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () => openDocument(context, item.document, lang),
                  child: Text(l10n.credView),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
