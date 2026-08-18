import 'package:flutter/material.dart';
import '../constants.dart';
import '../theme/app_theme.dart';

/// Icon(s) + Pacifico title + optional subtitle chip, the pattern repeated
/// inside every screen's header.
class SectionTitle extends StatelessWidget {
  final String title;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final Color iconColor;
  final TextStyle? titleStyle;
  final double titleFontSize;

  /// Subtitle rendered as a pill/chip (Home, Timeline, Playlists).
  final String? subtitleChip;
  final Color? chipBackground;
  final Color? chipTextColor;
  final TextStyle? subtitleChipStyle;

  /// Subtitle rendered as plain text (Women's Day).
  final String? subtitleText;
  final Color? subtitleTextColor;

  const SectionTitle({
    super.key,
    required this.title,
    this.leadingIcon,
    this.trailingIcon,
    this.iconColor = AppColors.accentBlue,
    this.titleStyle,
    this.titleFontSize = 28,
    this.subtitleChip,
    this.chipBackground,
    this.chipTextColor,
    this.subtitleChipStyle,
    this.subtitleText,
    this.subtitleTextColor,
  });

  @override
  Widget build(BuildContext context) {
    final resolvedTitleStyle = titleStyle ??
        AppTheme.headingFont.copyWith(
          fontSize: titleFontSize,
          color: AppColors.accentBlue,
          fontWeight: FontWeight.bold,
        );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (leadingIcon != null || trailingIcon != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (leadingIcon != null)
                Icon(leadingIcon, color: iconColor, size: 28),
              if (leadingIcon != null) const SizedBox(width: 12),
              Flexible(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: resolvedTitleStyle,
                ),
              ),
              if (trailingIcon != null) const SizedBox(width: 12),
              if (trailingIcon != null)
                Icon(trailingIcon, color: iconColor, size: 28),
            ],
          )
        else
          Text(
            title,
            textAlign: TextAlign.center,
            style: resolvedTitleStyle,
          ),
        if (subtitleChip != null) ...[
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: chipBackground ?? AppColors.lightBlue.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              subtitleChip!,
              style: subtitleChipStyle ??
                  TextStyle(
                    fontSize: 15,
                    color: chipTextColor ?? AppColors.deepBlue,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
            ),
          ),
        ],
        if (subtitleText != null) ...[
          const SizedBox(height: 8),
          Text(
            subtitleText!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: subtitleTextColor ?? Colors.white70,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ],
    );
  }
}
