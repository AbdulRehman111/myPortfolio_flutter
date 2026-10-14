import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

Future<bool> openExternal(String url) async {
  final uri = _resolve(url);
  if (uri == null) return false;
  if (await canLaunchUrl(uri)) {
    return launchUrl(uri, mode: LaunchMode.externalApplication);
  }
  return false;
}

Uri? _resolve(String url) {
  if (url.startsWith('http://') ||
      url.startsWith('https://') ||
      url.startsWith('mailto:') ||
      url.startsWith('tel:')) {
    return Uri.tryParse(url);
  }
  if (kIsWeb) {
    final origin = Uri.base.origin;
    if (url.startsWith('assets/')) {
      return Uri.parse('$origin/$url');
    }
    final path = url.startsWith('/') ? url : '/$url';
    return Uri.parse('$origin$path');
  }
  return Uri.tryParse(url);
}

Future<bool> openMail(String email, {String? subject, String? body}) {
  final uri = Uri(
    scheme: 'mailto',
    path: email,
    queryParameters: {
      if (subject != null) 'subject': subject,
      if (body != null) 'body': body,
    },
  );
  return launchUrl(uri);
}

Future<bool> openTel(String phone) => launchUrl(Uri(scheme: 'tel', path: phone));
