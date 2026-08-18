import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants.dart';
import '../theme/app_motion.dart';
import '../theme/app_theme.dart';
import '../widgets/content_card.dart';
import '../widgets/decorative_accent_row.dart';
import '../widgets/decorative_header.dart';

class LetterScreen extends StatelessWidget {
  const LetterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 20),
            DecorativeHeader(
              child: Column(
                children: [
                  Icon(Icons.mail, color: AppColors.accentBlue, size: 36),
                  const SizedBox(height: 16),
                  Text(
                    AppTexts.letterTitle,
                    style: AppTheme.headingFont.copyWith(
                      fontSize: 28,
                      color: AppColors.accentBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 80,
                    height: 3,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColors.lightBlue, AppColors.accentBlue],
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            )
                .animate()
                .fadeIn(duration: AppMotion.base, curve: AppMotion.curve)
                .slideY(begin: 0.06, end: 0, duration: AppMotion.base, curve: AppMotion.curve),
            const SizedBox(height: 32),
            ContentCard(
              padding: const EdgeInsets.all(28),
              borderColor: AppColors.lightBlue.withOpacity(0.3),
              borderWidth: 2,
              shadowColor: AppColors.accentBlue.withOpacity(0.1),
              child: Column(
                children: [
                  const HeartDivider(),
                  const SizedBox(height: 24),
                  Text(
                    AppTexts.letterContent,
                    style: TextStyle(
                      fontSize: 17,
                      color: AppColors.darkText,
                      height: 1.8,
                      letterSpacing: 0.3,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const HeartDivider(),
                ],
              ),
            )
                .animate(delay: AppMotion.staggerStep * 2)
                .fadeIn(duration: AppMotion.base, curve: AppMotion.curve)
                .slideY(begin: 0.06, end: 0, duration: AppMotion.base, curve: AppMotion.curve),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.lightBlue.withOpacity(0.3),
                    AppColors.skyBlue.withOpacity(0.2),
                  ],
                ),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: AppColors.accentBlue.withOpacity(0.4),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accentBlue.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.edit, color: AppColors.accentBlue, size: 20),
                  const SizedBox(width: 12),
                  Text(
                    AppTexts.letterSignature,
                    style: TextStyle(
                      fontSize: 19,
                      fontStyle: FontStyle.italic,
                      color: AppColors.accentBlue,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Icon(Icons.favorite, color: AppColors.accentBlue, size: 20),
                ],
              ),
            )
                .animate(delay: AppMotion.staggerStep * 4)
                .fadeIn(duration: AppMotion.base, curve: AppMotion.curve)
                .slideY(begin: 0.06, end: 0, duration: AppMotion.base, curve: AppMotion.curve),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
