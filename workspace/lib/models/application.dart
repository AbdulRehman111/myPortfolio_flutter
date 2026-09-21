import 'localized_text.dart';

class PublishedApplication {
  const PublishedApplication({
    required this.id,
    required this.name,
    required this.description,
    required this.technologies,
    required this.iconAsset,
    required this.isPlaceholder,
    this.screenshots = const [],
    this.playStoreUrl,
    this.appStoreUrl,
    this.demoUrl,
  });

  final String id;
  final LocalizedText name;
  final LocalizedText description;
  final List<String> technologies;
  final String iconAsset;
  final List<String> screenshots;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final String? demoUrl;
  final bool isPlaceholder;

  bool get hasPlay => playStoreUrl != null && playStoreUrl!.trim().isNotEmpty;
  bool get hasAppStore => appStoreUrl != null && appStoreUrl!.trim().isNotEmpty;
  bool get hasDemo => demoUrl != null && demoUrl!.trim().isNotEmpty;
}
