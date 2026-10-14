import 'localized_text.dart';

class Experience {
  const Experience({
    required this.id,
    required this.company,
    required this.position,
    required this.dates,
    required this.description,
    required this.responsibilities,
    required this.confirmed,
    this.technologies = const [],
    this.isPlaceholder = false,
  });

  final String id;
  final LocalizedText company;
  final LocalizedText position;
  final LocalizedText dates;
  final LocalizedText description;
  final LocalizedList responsibilities;
  final List<String> technologies;
  final bool confirmed;
  final bool isPlaceholder;
}
