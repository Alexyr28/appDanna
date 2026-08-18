import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants.dart';
import '../theme/app_motion.dart';
import '../theme/app_theme.dart';
import '../widgets/content_card.dart';
import '../widgets/decorative_header.dart';
import '../widgets/section_title.dart';

class WomenDayScreen extends StatefulWidget {
  const WomenDayScreen({super.key});

  @override
  State<WomenDayScreen> createState() => _WomenDayScreenState();
}

class _WomenDayScreenState extends State<WomenDayScreen>
    with SingleTickerProviderStateMixin {
  // Bespoke sequenced intro (rose burst + "Gracias" fade) — kept as a
  // hand-rolled AnimationController since it drives a single shared
  // timeline across multiple stages that flutter_animate's effect
  // chaining doesn't express more simply than this already does.
  late AnimationController _roseController;
  late Animation<double> _roseScale;
  late Animation<double> _roseOpacity;

  @override
  void initState() {
    super.initState();
    _roseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );
    _roseScale = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _roseController,
        curve: const Interval(0.0, 0.4, curve: Curves.elasticOut),
      ),
    );
    _roseOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _roseController,
        curve: const Interval(0.0, 0.3, curve: Curves.easeOut),
      ),
    );
    _roseController.forward();
  }

  @override
  void dispose() {
    _roseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth >= 900;

              return SingleChildScrollView(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1100),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 24),
                          const _WomenDayHeader(),
                          const SizedBox(height: 32),
                          if (isWide)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Expanded(
                                  flex: 3,
                                  child: _WomenDayCollage(),
                                ),
                                SizedBox(width: 32),
                                Expanded(
                                  flex: 2,
                                  child: _WomenDayMessageCard(),
                                ),
                              ],
                            )
                          else
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                _WomenDayCollage(),
                                SizedBox(height: 24),
                                _WomenDayMessageCard(),
                              ],
                            ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        // Animación rosa + gracias al entrar
        AnimatedBuilder(
          animation: _roseController,
          builder: (context, child) {
            if (_roseController.value >= 0.95) return const SizedBox.shrink();
            final opacity = _roseController.value < 0.7
                ? _roseOpacity.value
                : (1.0 - (_roseController.value - 0.7) / 0.25);
            return IgnorePointer(
              child: Container(
                color: Colors.black.withOpacity(0.3 * opacity),
                child: Center(
                  child: Opacity(
                    opacity: opacity,
                    child: ScaleTransition(
                      scale: _roseScale,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 6,
                            runSpacing: 6,
                            children: List.generate(
                              24,
                              (i) => Text(
                                '🌹',
                                style: TextStyle(
                                  fontSize: 28.0 + (i % 4) * 12,
                                  height: 1.2,
                                  shadows: [
                                    Shadow(
                                      color: Colors.white.withOpacity(0.5),
                                      blurRadius: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Gracias',
                            style: AppTheme.headingFont.copyWith(
                              fontSize: 36,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: const Color(0xFF6A4C93),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _WomenDayHeader extends StatelessWidget {
  const _WomenDayHeader();

  @override
  Widget build(BuildContext context) {
    // Paleta ligeramente distinta (morado/dorado) pero compatible con tu tema azul
    const Color purple = Color(0xFF6A4C93);
    const Color softPink = Color(0xFFF7CAD0);
    const Color softGold = Color(0xFFF6D365);

    return DecorativeHeader(
      borderRadius: 28,
      gradientColors: const [purple, softPink],
      borderColor: Colors.white.withOpacity(0.6),
      shadowColor: purple.withOpacity(0.30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.celebration, color: Colors.white, size: 26),
              SizedBox(width: 8),
              Icon(Icons.wb_sunny, color: Colors.white70, size: 20),
            ],
          ),
          const SizedBox(height: 18),
          SectionTitle(
            title: AppTexts.womenDayTitle,
            titleStyle: AppTheme.headingFont.copyWith(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.2,
            ),
            subtitleText: AppTexts.womenDaySubtitle,
            subtitleTextColor: Colors.white70,
          ),
          const SizedBox(height: 18),
          Container(
            width: 90,
            height: 3,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [softGold, Colors.white],
              ),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: AppMotion.base, curve: AppMotion.curve)
        .slideY(begin: 0.06, end: 0, duration: AppMotion.base, curve: AppMotion.curve);
  }
}

class _WomenDayCollage extends StatelessWidget {
  const _WomenDayCollage();

  static const List<String> _imagePaths = [
    'assets/images/dannaAmor1.png',
    'assets/images/dannaAmor2.png',
    'assets/images/dannaAmor3.png',
    'assets/images/dannaAmor4.png',
    'assets/images/dannaAmor5.png',
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxSize = constraints.maxWidth > 600 ? 280.0 : 160.0;
        return Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: _imagePaths
              .asMap()
              .entries
              .map((entry) => _CollagePhoto(
                    imagePath: entry.value,
                    maxSize: maxSize,
                    index: entry.key,
                  ))
              .toList(),
        );
      },
    );
  }
}

class _CollagePhoto extends StatelessWidget {
  final String imagePath;
  final double maxSize;
  final int index;

  const _CollagePhoto({
    required this.imagePath,
    required this.maxSize,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxSize, maxHeight: maxSize),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Image.asset(
          imagePath,
          fit: BoxFit.none,
          errorBuilder: (context, error, stackTrace) => Icon(
            Icons.image_not_supported,
            color: const Color(0xFF6A4C93).withOpacity(0.5),
            size: 48,
          ),
        ),
      ),
    )
        .animate(delay: AppMotion.staggerStep * index)
        .fadeIn(duration: AppMotion.base, curve: AppMotion.curve);
  }
}

class _WomenDayMessageCard extends StatelessWidget {
  const _WomenDayMessageCard();

  @override
  Widget build(BuildContext context) {
    const Color purple = Color(0xFF6A4C93);
    const Color softGold = Color(0xFFF6D365);

    return ContentCard(
      borderColor: purple.withOpacity(0.25),
      borderWidth: 1.6,
      shadowColor: purple.withOpacity(0.20),
      borderRadius: 26,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.format_quote, color: Colors.black26, size: 18),
              SizedBox(width: 6),
              Icon(Icons.star, color: softGold, size: 18),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            AppTexts.womenDayMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              height: 1.7,
              color: AppColors.darkText,
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [softGold, purple],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Feliz Día de la Mujer',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.8,
                ),
              ),
            ),
          ),
        ],
      ),
    )
        .animate(delay: AppMotion.staggerStep * 3)
        .fadeIn(duration: AppMotion.base, curve: AppMotion.curve)
        .slideY(begin: 0.06, end: 0, duration: AppMotion.base, curve: AppMotion.curve);
  }
}
