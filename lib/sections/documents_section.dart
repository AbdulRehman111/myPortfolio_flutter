import 'package:flutter/material.dart';
import 'package:portfolio/generated/app_localizations.dart';

import '../app/app_settings.dart';
import '../data/portfolio_data.dart';
import '../models/models.dart';
import '../screens/document_viewer_screen.dart';
import '../theme/app_colors.dart';
import '../utils/launch_helper.dart';
import '../widgets/hover_card.dart';
import '../widgets/responsive_grid.dart';
import '../widgets/reveal.dart';
import '../widgets/safe_image.dart';
import '../widgets/section_shell.dart';
import '../widgets/status_chip.dart';

class DocumentsSection extends StatefulWidget {
  const DocumentsSection({super.key});

  @override
  State<DocumentsSection> createState() => _DocumentsSectionState();
}

class _DocumentsSectionState extends State<DocumentsSection> {
  DocumentKind? _filter;
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final lang = AppSettingsScope.of(context).locale.languageCode;
    final theme = Theme.of(context);

    final items = PortfolioData.documents.where((d) {
      if (_filter != null && d.kind != _filter) return false;
      if (_query.trim().isEmpty) return true;
      final q = _query.toLowerCase();
      return d.title.resolve(lang).toLowerCase().contains(q) ||
          d.fileName.toLowerCase().contains(q) ||
          d.extension.toLowerCase().contains(q);
    }).toList();

    return SectionShell(
      id: 'documents',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Reveal(
            child: SectionHeader(
              eyebrow: l10n.docsEyebrow,
              title: l10n.docsTitle,
              lead: l10n.docsLead,
            ),
          ),
          const SizedBox(height: 24),
          Reveal(
            delay: const Duration(milliseconds: 80),
            child: TextField(
              onChanged: (v) => setState(() => _query = v),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: l10n.docsSearch,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _chip(l10n.filterAll, null),
              _chip(l10n.docsFilterCv, DocumentKind.cv),
              _chip(l10n.docsFilterCerts, DocumentKind.certificate),
              _chip(l10n.docsFilterAwards, DocumentKind.award),
              _chip(l10n.docsFilterLetters, DocumentKind.letter),
              _chip(l10n.docsFilterStudies, DocumentKind.caseStudy),
              _chip(l10n.docsFilterOther, DocumentKind.other),
              _chip(l10n.navAppreciations, DocumentKind.appreciation),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            l10n.docsCount(items.length),
            style: theme.textTheme.bodySmall,
          ),
          const SizedBox(height: 24),
          ResponsiveGrid(
            desktopColumns: 3,
            children: [
              for (var i = 0; i < items.length; i++)
                Reveal(
                  delay: Duration(milliseconds: 50 * (i % 6)),
                  child: _DocCard(
                    document: items[i],
                    lang: lang,
                    l10n: l10n,
                    onOpen: () => openDocument(context, items[i], lang),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _chip(String label, DocumentKind? kind) {
    final selected = _filter == kind;
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => setState(() => _filter = kind),
      selectedColor: AppColors.navy,
      labelStyle: TextStyle(
        color: selected ? Colors.white : Theme.of(context).colorScheme.onSurface,
        fontWeight: FontWeight.w600,
      ),
      side: BorderSide(color: Theme.of(context).dividerColor),
    );
  }
}

class _DocCard extends StatelessWidget {
  const _DocCard({
    required this.document,
    required this.lang,
    required this.l10n,
    required this.onOpen,
  });

  final PortfolioDocument document;
  final String lang;
  final AppLocalizations l10n;
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final thumb = document.previewAsset;
    return HoverCard(
      padding: EdgeInsets.zero,
      onTap: onOpen,
      semanticLabel: document.title.resolve(lang),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: AspectRatio(
              aspectRatio: 16 / 10,
              child: thumb.isNotEmpty
                  ? SafeImage(
                      asset: thumb,
                      fit: BoxFit.cover,
                      fallbackIcon: Icons.insert_drive_file_outlined,
                      label: document.extension.toUpperCase(),
                    )
                  : ColoredBox(
                      color: AppColors.navy,
                      child: Center(
                        child: Text(
                          document.extension.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.4,
                          ),
                        ),
                      ),
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StatusChip(label: document.extension.toUpperCase(), tone: ChipTone.accent),
                const SizedBox(height: 8),
                Text(document.title.resolve(lang), style: theme.textTheme.titleSmall),
                const SizedBox(height: 6),
                Text(document.description.resolve(lang), style: theme.textTheme.bodySmall, maxLines: 3, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 10),
                Text(document.fileName, style: theme.textTheme.labelMedium),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: onOpen,
                        child: Text(l10n.docsOpen),
                      ),
                    ),
                    const SizedBox(width: 8),
                    OutlinedButton(
                      onPressed: () => openExternal(document.openUrl),
                      child: Text(l10n.docsNewTab),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
