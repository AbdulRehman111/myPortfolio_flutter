import 'localized_text.dart';

class Certification {
  const Certification({
    required this.id,
    required this.title,
    required this.organization,
    required this.date,
    required this.description,
    required this.imageAsset,
    required this.isPlaceholder,
    this.credentialUrl,
  });

  final String id;
  final LocalizedText title;
  final LocalizedText organization;
  final LocalizedText date;
  final LocalizedText description;
  final String imageAsset;
  final String? credentialUrl;
  final bool isPlaceholder;

  bool get hasCredential =>
      credentialUrl != null && credentialUrl!.trim().isNotEmpty;
}
