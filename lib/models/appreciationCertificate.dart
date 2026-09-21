import 'package:portfolio/models/localized_text.dart';

class AppreciationCertificate {
  const AppreciationCertificate({
    required this.id,
    required this.title,
    required this.organization,
    required this.date,
    required this.description,
    required this.imageAsset,
    this.isPlaceholder = false,
  });

  final String id;
  final LocalizedText title;
  final LocalizedText organization;
  final LocalizedText date;
  final LocalizedText description;
  final String imageAsset;
  final bool isPlaceholder;
}
