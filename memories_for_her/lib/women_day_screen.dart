import 'package:flutter/material.dart';
import 'constants.dart';

class WomenDayScreen extends StatefulWidget {
  const WomenDayScreen({super.key});

  @override
  State<WomenDayScreen> createState() => _WomenDayScreenState();
}

class _WomenDayScreenState extends State<WomenDayScreen>
    with SingleTickerProviderStateMixin {
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

          // Centro el contenido y limito el ancho máximo para web
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
                      _WomenDayHeader(),
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
                            style: TextStyle(
                              fontFamily: 'Pacifico',
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

    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [purple, softPink],
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: purple.withOpacity(0.30),
            blurRadius: 20,
            offset: const Offset(0, 12),
          ),
        ],
        border: Border.all(
          color: Colors.white.withOpacity(0.6),
          width: 1.5,
        ),
      ),
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
          Text(
            AppTexts.womenDayTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            AppTexts.womenDaySubtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white70,
              letterSpacing: 0.5,
            ),
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
    );
  }
}

class _WomenDayCollage extends StatelessWidget {
  const _WomenDayCollage();

  // Rutas de assets (relativas al proyecto, sin prefijo del paquete)
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
              .map((path) => _CollagePhoto(imagePath: path, maxSize: maxSize))
              .toList(),
        );
      },
    );
  }
}

class _CollagePhoto extends StatelessWidget {
  final String imagePath;
  final double maxSize;

  const _CollagePhoto({
    required this.imagePath,
    required this.maxSize,
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
    );
  }
}

class _WomenDayMessageCard extends StatelessWidget {
  const _WomenDayMessageCard();

  @override
  Widget build(BuildContext context) {
    const Color purple = Color(0xFF6A4C93);
    const Color softGold = Color(0xFFF6D365);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color: purple.withOpacity(0.25),
          width: 1.6,
        ),
        boxShadow: [
          BoxShadow(
            color: purple.withOpacity(0.20),
            blurRadius: 16,
            offset: const Offset(0, 10),
          ),
        ],
      ),
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
    );
  }
}
