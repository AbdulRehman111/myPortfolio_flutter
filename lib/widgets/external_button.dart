import 'package:flutter/material.dart';

import '../utils/launch_helper.dart';

class ExternalButton extends StatelessWidget {
  const ExternalButton({
    super.key,
    required this.label,
    required this.url,
    this.icon,
    this.outlined = true,
  });

  final String label;
  final String url;
  final IconData? icon;
  final bool outlined;

  @override
  Widget build(BuildContext context) {
    final child = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(icon, size: 16),
          const SizedBox(width: 8),
        ],
        Text(label),
      ],
    );

    if (outlined) {
      return OutlinedButton(
        onPressed: () => openExternal(url),
        child: child,
      );
    }
    return ElevatedButton(
      onPressed: () => openExternal(url),
      child: child,
    );
  }
}
