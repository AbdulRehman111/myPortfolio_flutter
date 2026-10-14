class ExpertiseItem {
  const ExpertiseItem({
    required this.id,
    required this.titleKey,
    required this.bodyKey,
    required this.iconName,
    this.featured = false,
  });

  final String id;
  final String titleKey;
  final String bodyKey;
  final String iconName;
  final bool featured;
}
