import 'package:flutter/material.dart';
import '../constants.dart';

/// dot-line[-icon-line-dot] accent row used above/below the Home header.
class DecorativeAccentRow extends StatelessWidget {
  final IconData? icon;
  final double lineWidth;
  final Color color;

  const DecorativeAccentRow({
    super.key,
    this.icon,
    this.lineWidth = 60,
    this.color = AppColors.accentBlue,
  });

  Widget _dot() => Container(
        width: 6,
        height: 6,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      );

  Widget _line() => Container(
        width: lineWidth,
        height: 2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.3),
              AppColors.lightBlue,
              color.withOpacity(0.3),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _dot(),
        const SizedBox(width: 8),
        _line(),
        if (icon != null) ...[
          const SizedBox(width: 8),
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 8),
          _line(),
        ],
        const SizedBox(width: 8),
        _dot(),
      ],
    );
  }
}

/// heart-line-heart-line-heart divider used at the top/bottom of the Letter.
class HeartDivider extends StatelessWidget {
  final Color color;

  const HeartDivider({super.key, this.color = AppColors.accentBlue});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.favorite, color: color.withOpacity(0.3), size: 16),
        const SizedBox(width: 8),
        Container(width: 40, height: 2, color: AppColors.lightBlue.withOpacity(0.4)),
        const SizedBox(width: 8),
        Icon(Icons.favorite, color: color, size: 20),
        const SizedBox(width: 8),
        Container(width: 40, height: 2, color: AppColors.lightBlue.withOpacity(0.4)),
        const SizedBox(width: 8),
        Icon(Icons.favorite, color: color.withOpacity(0.3), size: 16),
      ],
    );
  }
}
