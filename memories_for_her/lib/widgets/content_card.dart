import 'package:flutter/material.dart';
import '../constants.dart';

/// Reusable white/colored rounded card + border + shadow wrapper used for
/// message bodies, timeline tiles, playlist cards, etc.
class ContentCard extends StatelessWidget {
  final Widget child;
  final Color background;
  final Gradient? gradient;
  final Color? borderColor;
  final double borderWidth;
  final Color? shadowColor;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;

  const ContentCard({
    super.key,
    required this.child,
    this.background = Colors.white,
    this.gradient,
    this.borderColor,
    this.borderWidth = 1.5,
    this.shadowColor,
    this.borderRadius = 25,
    this.padding = const EdgeInsets.all(24),
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: gradient == null ? background : null,
        gradient: gradient,
        borderRadius: BorderRadius.circular(borderRadius),
        border: borderColor != null
            ? Border.all(color: borderColor!, width: borderWidth)
            : null,
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? AppColors.accentBlue.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: child,
    );
  }
}
