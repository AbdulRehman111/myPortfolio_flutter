import 'document.dart';
import 'localized_text.dart';

class AcademicCredential {
  const AcademicCredential({
    required this.id,
    required this.title,
    required this.meta,
    required this.description,
    required this.kind,
    required this.document,
    this.pairId = '',
    this.isUae = false,
  });

  final String id;
  final LocalizedText title;
  final LocalizedText meta;
  final LocalizedText description;
  final String kind;
  final PortfolioDocument document;
  final String pairId;
  final bool isUae;
}
