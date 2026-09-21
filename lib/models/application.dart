import 'package:portfolio/models/localized_text.dart';

class PublishedApplication {
  final String id;
  final LocalizedText name;
  final LocalizedText subtitle;
  final LocalizedText description;
  final LocalizedText role;
  final LocalizedText impact;

  final List<String> technologies;
  final List<String> platforms;
  final List<String> features;

  final String iconAsset;
  final List<String> screenshots;

  final String? appStoreUrl;
  final String? playStoreUrl;
  final String? demoUrl;

  final bool isFeatured;
  final bool isPlaceholder;

  const PublishedApplication({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.description,
    required this.role,
    required this.impact,
    required this.technologies,
    required this.platforms,
    required this.features,
    required this.iconAsset,
    required this.screenshots,
    this.appStoreUrl,
    this.playStoreUrl,
    this.demoUrl,
    this.isFeatured = false,
    this.isPlaceholder = false,
  });

  /// Whether an App Store link is available.
  bool get hasAppStore => appStoreUrl != null && appStoreUrl!.trim().isNotEmpty;

  /// Whether a Google Play link is available.
  bool get hasPlay => playStoreUrl != null && playStoreUrl!.trim().isNotEmpty;

  /// Whether a website/demo link is available.
  bool get hasDemo => demoUrl != null && demoUrl!.trim().isNotEmpty;
}
