import 'package:flutter/material.dart';

enum SocialKind { linkedin, github, email, playStore, appStore, phone, website }

class SocialLink {
  const SocialLink({
    required this.kind,
    required this.label,
    required this.url,
    required this.icon,
  });

  final SocialKind kind;
  final String label;
  final String url;
  final IconData icon;

  bool get hasUrl => url.trim().isNotEmpty;
}
