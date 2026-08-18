import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';

/// Central theme builder. Reads color tokens from [AppColors] and wires
/// real fonts (via google_fonts) instead of relying on unbundled
/// fontFamily string literals.
class AppTheme {
  AppTheme._();

  /// Base style for decorative headings. Screens apply
  /// `.copyWith(fontSize:, color:, ...)` on top of this.
  static TextStyle get headingFont => GoogleFonts.pacifico();

  static ThemeData light() {
    final base = ThemeData.light();
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.accentBlue,
      brightness: Brightness.light,
    ).copyWith(
      primary: AppColors.accentBlue,
      secondary: AppColors.lightBlue,
      surface: AppColors.cream,
      onSurface: AppColors.darkText,
    );

    return base.copyWith(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.cream,
      primaryColor: AppColors.accentBlue,
      textTheme: GoogleFonts.crimsonTextTextTheme(base.textTheme).copyWith(
        displayLarge: GoogleFonts.crimsonText(
          fontSize: 36,
          fontWeight: FontWeight.w600,
          color: AppColors.darkText,
          height: 1.2,
        ),
        displayMedium: GoogleFonts.crimsonText(
          fontSize: 28,
          fontWeight: FontWeight.w500,
          color: AppColors.darkText,
        ),
        bodyLarge: GoogleFonts.crimsonText(
          fontSize: 18,
          color: AppColors.darkText,
          height: 1.6,
        ),
        bodyMedium: GoogleFonts.crimsonText(
          fontSize: 16,
          color: AppColors.darkText,
          height: 1.5,
        ),
      ),
    );
  }
}
