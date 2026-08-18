import 'package:flutter/material.dart';
import '../constants.dart';

/// Reusable gradient/border/shadow header shell used across every screen.
/// Defaults to the app's blue palette; pass overrides (e.g. Women's Day)
/// for a distinct accent color.
class DecorativeHeader extends StatelessWidget {
  final Widget child;
  final List<Color>? gradientColors;
  final Color? borderColor;
  final Color? shadowColor;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;

  const DecorativeHeader({
    super.key,
    required this.child,
    this.gradientColors,
    this.borderColor,
    this.shadowColor,
    this.borderRadius = 25,
    this.padding = const EdgeInsets.all(24),
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final colors = gradientColors ??
        [
          AppColors.accentBlue.withOpacity(0.15),
          AppColors.lightBlue.withOpacity(0.1),
        ];
    final border = borderColor ?? AppColors.accentBlue.withOpacity(0.3);
    final shadow = shadowColor ?? AppColors.accentBlue.withOpacity(0.1);

    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: border, width: 2),
        boxShadow: [
          BoxShadow(
            color: shadow,
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: child,
    );
  }
}
