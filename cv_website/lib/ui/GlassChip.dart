import 'package:flutter/material.dart';
import 'dart:ui';

class GlassChip extends StatefulWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onTap; // <- 추가!

  const GlassChip({
    super.key,
    required this.label,
    this.icon,
    this.onTap, // <- 초기화
  });

  @override
  State<GlassChip> createState() => _GlassChipState();
}

class _GlassChipState extends State<GlassChip> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final bgColor = _hovering
        ? Colors.white.withOpacity(0.18)
        : Colors.white.withOpacity(0.1);
    final borderColor = _hovering
        ? Colors.white.withOpacity(0.6)
        : Colors.white.withOpacity(0.3);
    final shadow = _hovering
        ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.35),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ]
        : [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 6,
              offset: const Offset(0, 3),
            )
          ];

    final chipContent = AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: borderColor),
        color: bgColor,
        boxShadow: shadow,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                Icon(widget.icon, size: 18, color: Colors.white),
                const SizedBox(width: 6),
              ],
              Text(
                widget.label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    final interactiveChip = MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor:
          widget.onTap != null ? SystemMouseCursors.click : MouseCursor.defer,
      child: GestureDetector(
        onTap: widget.onTap,
        child: chipContent,
      ),
    );

    return widget.onTap != null ? interactiveChip : chipContent;
  }
}
