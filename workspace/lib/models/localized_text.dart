class LocalizedText {
  const LocalizedText({required this.en, required this.ar});

  final String en;
  final String ar;

  String resolve(String languageCode) => languageCode == 'ar' ? ar : en;

  static const empty = LocalizedText(en: '', ar: '');
}

class LocalizedList {
  const LocalizedList({required this.en, required this.ar});

  final List<String> en;
  final List<String> ar;

  List<String> resolve(String languageCode) => languageCode == 'ar' ? ar : en;
}
