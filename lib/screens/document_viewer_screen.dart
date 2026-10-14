import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/models.dart';
import '../theme/app_colors.dart';
import '../utils/launch_helper.dart';
import '../widgets/safe_image.dart';

class DocumentViewerScreen extends StatefulWidget {
  const DocumentViewerScreen({super.key, required this.document, required this.lang});

  final PortfolioDocument document;
  final String lang;

  @override
  State<DocumentViewerScreen> createState() => _DocumentViewerScreenState();
}

class _DocumentViewerScreenState extends State<DocumentViewerScreen> {
  String? _html;
  bool _loading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    if (widget.document.isHtml) {
      _loadHtml();
    }
  }

  Future<void> _loadHtml() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final raw = await rootBundle.loadString(widget.document.assetPath);
      if (mounted) {
        setState(() {
          _html = raw;
          _loading = false;
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() {
          _error = 'Could not load this file.';
          _loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final doc = widget.document;
    final title = doc.title.resolve(widget.lang);
    return Scaffold(
      backgroundColor: const Color(0xFF071018),
      appBar: AppBar(
        backgroundColor: AppColors.navy,
        foregroundColor: Colors.white,
        titleSpacing: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text(
              '${doc.fileName}  ·  ${doc.extension.toUpperCase()}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 11, color: Color(0xFFB7C4D6)),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Open full file',
            onPressed: () => openExternal(doc.openUrl),
            icon: const Icon(Icons.open_in_new),
          ),
          IconButton(
            tooltip: 'Download',
            onPressed: () => openExternal(doc.openUrl),
            icon: const Icon(Icons.download_outlined),
          ),
        ],
      ),
      body: SafeArea(child: _body(doc)),
    );
  }

  Widget _body(PortfolioDocument doc) {
    if (doc.isImage) {
      return LayoutBuilder(
        builder: (context, constraints) {
          return InteractiveViewer(
            minScale: 0.5,
            maxScale: 6,
            child: SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
                child: Center(
                child: SafeImage(
                  asset: doc.assetPath,
                  fit: BoxFit.contain,
                  width: constraints.maxWidth,
                  fallbackIcon: Icons.insert_drive_file_outlined,
                  label: doc.title.resolve(widget.lang),
                ),
              ),
            ),
          );
        },
      );
    }
    if (doc.isHtml) {
      if (_loading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (_error != null) {
        return _fallback(doc, _error!);
      }
      return ColoredBox(
        color: const Color(0xFFF6F4EE),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 80),
          child: SelectableText(
            _stripHtml(_html ?? ''),
            style: const TextStyle(
              fontSize: 15,
              height: 1.65,
              color: Color(0xFF122033),
            ),
          ),
        ),
      );
    }
    return _fallback(
      doc,
      kIsWeb
          ? 'Open the full file in a new tab to view or download it.'
          : 'This file type opens externally.',
    );
  }

  Widget _fallback(PortfolioDocument doc, String message) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 88,
                height: 112,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.navySoft,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.accent.withOpacity(0.4)),
                ),
                child: Text(
                  doc.extension.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              const SizedBox(height: 22),
              Text(
                doc.fileName,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color(0xFFB7C4D6), height: 1.5),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () => openExternal(doc.openUrl),
                icon: const Icon(Icons.open_in_new, size: 18),
                label: const Text('Open full file'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _stripHtml(String raw) {
    return raw
        .replaceAll(RegExp(r'<style[\s\S]*?</style>', caseSensitive: false), '')
        .replaceAll(RegExp(r'<script[\s\S]*?</script>', caseSensitive: false), '')
        .replaceAll(RegExp(r'<[^>]+>'), ' ')
        .replaceAll(RegExp(r'&nbsp;'), ' ')
        .replaceAll(RegExp(r'&amp;'), '&')
        .replaceAll(RegExp(r'&#39;'), "'")
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
  }
}

void openDocument(BuildContext context, PortfolioDocument document, String lang) {
  Navigator.of(context).push(
    PageRouteBuilder(
      pageBuilder: (_, animation, __) => FadeTransition(
        opacity: animation,
        child: DocumentViewerScreen(document: document, lang: lang),
      ),
      transitionDuration: const Duration(milliseconds: 280),
    ),
  );
}
