import 'localized_text.dart';

enum DocumentKind { cv, certificate, award, appreciation, letter, caseStudy, other }

class PortfolioDocument {
  const PortfolioDocument({
    required this.id,
    required this.title,
    required this.description,
    required this.kind,
    required this.fileName,
    required this.extension,
    required this.assetPath,
    required this.openUrl,
    this.thumbnail,
    this.sizeLabel = '',
    this.issuedBy,
    this.dateLabel,
  });

  final String id;
  final LocalizedText title;
  final LocalizedText description;
  final DocumentKind kind;
  final String fileName;
  final String extension;
  final String assetPath;
  final String openUrl;
  final String? thumbnail;
  final String sizeLabel;
  final LocalizedText? issuedBy;
  final LocalizedText? dateLabel;

  bool get isImage {
    final ext = extension.toLowerCase();
    return ext == 'png' ||
        ext == 'jpg' ||
        ext == 'jpeg' ||
        ext == 'webp' ||
        ext == 'gif';
  }

  bool get isPdf => extension.toLowerCase() == 'pdf';
  bool get isHtml => extension.toLowerCase() == 'html';
  bool get canPreviewInApp => isImage || isHtml || isPdf;

  String get previewAsset => thumbnail ?? (isImage ? assetPath : '');
}
