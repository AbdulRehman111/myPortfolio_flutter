import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class StatusChip extends StatelessWidget {
  const StatusChip({
    super.key,
    required this.label,
    this.tone = ChipTone.neutral,
  });

  final String label;
  final ChipTone tone;

  @override
  Widget build(BuildContext context) {
    final (bg, fg) = switch (tone) {
      ChipTone.accent => (AppColors.accent.withOpacity(0.16), AppColors.accent),
      ChipTone.confirm => (const Color(0xFF166534).withOpacity(0.12), const Color(0xFF166534)),
      ChipTone.warn => (const Color(0xFF92400E).withOpacity(0.12), const Color(0xFF92400E)),
      ChipTone.neutral => (
          Theme.of(context).dividerColor.withOpacity(0.5),
          Theme.of(context).textTheme.bodySmall?.color ?? Colors.grey,
        ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(color: fg),
      ),
    );
  }
}

enum ChipTone { accent, confirm, warn, neutral }

class TechChip extends StatelessWidget {
  const TechChip({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.navySoft
            : const Color(0xFFEEF3F8),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: AppColors.accent.withOpacity(0.18),
        ),
      ),
      child: Text(label, style: Theme.of(context).textTheme.labelMedium),
    );
  }
}
