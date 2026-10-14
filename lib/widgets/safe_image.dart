import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class SafeImage extends StatelessWidget {
  const SafeImage({
    super.key,
    required this.asset,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.fallbackIcon = Icons.auto_awesome,
    this.label,
    this.borderRadius,
  });

  final String asset;
  final BoxFit fit;
  final double? width;
  final double? height;
  final IconData fallbackIcon;
  final String? label;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final image = asset.trim().isEmpty
        ? _Fallback(icon: fallbackIcon, label: label)
        : Image.asset(
            asset,
            fit: fit,
            width: width,
            height: height,
            errorBuilder: (_, __, ___) =>
                _Fallback(icon: fallbackIcon, label: label),
          );

    if (borderRadius == null) return image;
    return ClipRRect(borderRadius: borderRadius!, child: image);
  }
}

class _Fallback extends StatelessWidget {
  const _Fallback({required this.icon, this.label});

  final IconData icon;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0E2744),
            Color(0xFF163056),
            Color(0xFF1E4E79),
          ],
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          const CustomPaint(painter: _GridPainter()),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.accent.withOpacity(0.55)),
                    color: Colors.white.withOpacity(0.06),
                  ),
                  child: Icon(icon, color: AppColors.accent, size: 26),
                ),
                if (label != null && label!.trim().isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      label!,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFFE8EEF6),
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  const _GridPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0x33D4B06A)
      ..strokeWidth = 0.6;
    const step = 22.0;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
