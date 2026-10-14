import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config/firebase_config.dart';

class InquiryPayload {
  const InquiryPayload({
    required this.name,
    required this.email,
    required this.subject,
    required this.message,
    required this.lang,
    this.source = 'flutter',
  });

  final String name;
  final String email;
  final String subject;
  final String message;
  final String lang;
  final String source;
}

class InquiryService {
  const InquiryService();

  Future<void> submit(InquiryPayload payload) async {
    if (!FirebaseConfig.isConfigured) {
      throw const InquiryException('missing-config');
    }
    final uri = Uri.https(
      'firestore.googleapis.com',
      '/v1/projects/${FirebaseConfig.projectId}/databases/(default)/documents/${FirebaseConfig.collection}',
      {'key': FirebaseConfig.apiKey},
    );
    final response = await http.post(
      uri,
      headers: const {'Content-Type': 'application/json'},
      body: jsonEncode({
        'fields': {
          'name': {'stringValue': payload.name},
          'email': {'stringValue': payload.email},
          'subject': {'stringValue': payload.subject},
          'message': {'stringValue': payload.message},
          'lang': {'stringValue': payload.lang},
          'source': {'stringValue': payload.source},
          'createdAt': {
            'timestampValue': DateTime.now().toUtc().toIso8601String(),
          },
        },
      }),
    );
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw InquiryException('http-${response.statusCode}');
    }
  }
}

class InquiryException implements Exception {
  const InquiryException(this.code);

  final String code;

  @override
  String toString() => 'InquiryException($code)';
}
