class SkillGroup {
  const SkillGroup({
    required this.id,
    required this.titleKey,
    required this.items,
    required this.iconName,
    this.featured = false,
  });

  final String id;
  final String titleKey;
  final List<String> items;
  final String iconName;
  final bool featured;
}
