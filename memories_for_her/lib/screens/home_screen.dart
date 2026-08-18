import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants.dart';
import '../theme/app_motion.dart';
import '../theme/app_theme.dart';
import '../widgets/content_card.dart';
import '../widgets/decorative_accent_row.dart';
import '../widgets/decorative_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: DecorativeHeader(
                borderRadius: 30,
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    const DecorativeAccentRow(icon: Icons.favorite),
                    const SizedBox(height: 24),
                    Text(
                      AppTexts.welcomeTitle,
                      textAlign: TextAlign.center,
                      style: AppTheme.headingFont.copyWith(
                        fontSize: 34,
                        color: AppColors.accentBlue,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: AppColors.lightBlue.withOpacity(0.5),
                            offset: const Offset(2, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: AppColors.accentBlue.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.accentBlue.withOpacity(0.3),
                          width: 1.5,
                        ),
                      ),
                      child: Text(
                        AppTexts.welcomeSubtitle,
                        style: AppTheme.headingFont.copyWith(
                          fontSize: 28,
                          color: AppColors.deepBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const DecorativeAccentRow(lineWidth: 100),
                  ],
                ),
              ),
            )
                .animate()
                .fadeIn(duration: AppMotion.base, curve: AppMotion.curve)
                .slideY(begin: 0.06, end: 0, duration: AppMotion.base, curve: AppMotion.curve),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ContentCard(
                child: Column(
                  children: [
                    Icon(
                      Icons.auto_stories,
                      size: 40,
                      color: AppColors.accentBlue,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      AppTexts.welcomeMessage,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        color: AppColors.darkText,
                        height: 1.7,
                        letterSpacing: 0.3,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [AppColors.lightBlue, AppColors.accentBlue],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.accentBlue.withOpacity(0.4),
                            blurRadius: 15,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
            )
                .animate(delay: AppMotion.staggerStep * 2)
                .fadeIn(duration: AppMotion.base, curve: AppMotion.curve)
                .slideY(begin: 0.06, end: 0, duration: AppMotion.base, curve: AppMotion.curve),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
