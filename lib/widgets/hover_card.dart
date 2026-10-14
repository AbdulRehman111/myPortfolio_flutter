import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class HoverCard extends StatefulWidget {
  const HoverCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding,
    this.semanticLabel,
  });

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final String? semanticLabel;

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _hover = false;
  Offset _tilt = Offset.zero;

  void _onHover(PointerEvent event, Size size) {
    final dx = ((event.localPosition.dx / size.width) - 0.5) * 0.04;
    final dy = ((event.localPosition.dy / size.height) - 0.5) * -0.04;
    setState(() {
      _hover = true;
      _tilt = Offset(dx, dy);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final useTilt = Theme.of(context).platform != TargetPlatform.android &&
        Theme.of(context).platform != TargetPlatform.iOS;

    return MouseRegion(
      onHover: (e) {
        if (!useTilt) return;
        final box = context.findRenderObject() as RenderBox?;
        if (box == null || !box.hasSize) return;
        _onHover(e, box.size);
      },
      onExit: (_) => setState(() {
        _hover = false;
        _tilt = Offset.zero;
      }),
      child: Semantics(
        button: widget.onTap != null,
        label: widget.semanticLabel,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(20),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 240),
              curve: Curves.easeOutCubic,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.0012)
                ..rotateX(_tilt.dy)
                ..rotateY(_tilt.dx)
                ..translate(0.0, _hover ? -6.0 : 0.0),
              padding: widget.padding ?? const EdgeInsets.all(22),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    theme.colorScheme.surface,
                    isDark
                        ? AppColors.navySoft.withOpacity(0.55)
                        : Colors.white,
                  ],
                ),
                border: Border.all(
                  color: _hover
                      ? AppColors.accent.withOpacity(0.85)
                      : theme.dividerColor.withOpacity(0.9),
                  width: _hover ? 1.5 : 1,
                ),
                boxShadow: [
                  if (_hover)
                    BoxShadow(
                      color: AppColors.accent.withOpacity(isDark ? 0.22 : 0.18),
                      blurRadius: 36,
                      offset: const Offset(0, 18),
                    ),
                  BoxShadow(
                    color: AppColors.blue.withOpacity(isDark ? 0.18 : 0.08),
                    blurRadius: _hover ? 32 : 12,
                    offset: Offset(0, _hover ? 16 : 6),
                  ),
                ],
              ),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
