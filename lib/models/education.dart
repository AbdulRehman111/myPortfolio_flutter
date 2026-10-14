import 'localized_text.dart';

class Education {
  const Education({
    required this.id,
    required this.institution,
    required this.degree,
    required this.dates,
    required this.description,
    required this.confirmed,
    this.isPlaceholder = false,
  });

  final String id;
  final LocalizedText institution;
  final LocalizedText degree;
  final LocalizedText dates;
  final LocalizedText description;
  final bool confirmed;
  final bool isPlaceholder;
}
