import 'localized_text.dart';

class Award {
  const Award({
    required this.id,
    required this.title,
    required this.organization,
    required this.date,
    required this.description,
    required this.imageAsset,
    required this.isPlaceholder,
  });

  final String id;
  final LocalizedText title;
  final LocalizedText organization;
  final LocalizedText date;
  final LocalizedText description;
  final String imageAsset;
  final bool isPlaceholder;
}
