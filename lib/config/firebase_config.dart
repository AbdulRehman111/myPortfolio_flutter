class FirebaseConfig {
  const FirebaseConfig._();

  static const String apiKey = String.fromEnvironment(
    'FIREBASE_API_KEY',
    defaultValue: 'AIzaSyACeqAkcQI3Ibt9MSfPQI50y6Iq7t-ZrZ0',
  );
  static const String projectId = String.fromEnvironment(
    'FIREBASE_PROJECT_ID',
    defaultValue: 'myportfolio-c1e2b',
  );
  static const String collection = String.fromEnvironment(
    'FIREBASE_COLLECTION',
    defaultValue: 'inquiries',
  );

  static bool get isConfigured =>
      apiKey.trim().isNotEmpty && projectId.trim().isNotEmpty;
}