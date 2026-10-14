import 'localized_text.dart';

enum ProjectCategory { mobile, web, fullStack, api }

class Project {
  const Project({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.technologies,
    required this.features,
    required this.responsibilities,
    required this.imageAsset,
    required this.isPlaceholder,
    this.screenshots = const [],
    this.demoUrl,
    this.githubUrl,
    this.playStoreUrl,
    this.appStoreUrl,
    this.featured = false,
  });

  final String id;
  final LocalizedText name;
  final LocalizedText description;
  final ProjectCategory category;
  final List<String> technologies;
  final LocalizedList features;
  final LocalizedList responsibilities;
  final String imageAsset;
  final List<String> screenshots;
  final String? demoUrl;
  final String? githubUrl;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final bool featured;
  final bool isPlaceholder;

  bool get hasDemo => demoUrl != null && demoUrl!.trim().isNotEmpty;
  bool get hasGithub => githubUrl != null && githubUrl!.trim().isNotEmpty;
  bool get hasPlay => playStoreUrl != null && playStoreUrl!.trim().isNotEmpty;
  bool get hasAppStore => appStoreUrl != null && appStoreUrl!.trim().isNotEmpty;
}
