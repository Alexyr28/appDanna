import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'women_day_screen.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Para que nunca olvides',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.cream,
        fontFamily: 'Crimson Text',
        primaryColor: AppColors.accentBlue,
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w600,
            color: AppColors.darkText,
            height: 1.2,
          ),
          displayMedium: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w500,
            color: AppColors.darkText,
          ),
          bodyLarge: TextStyle(
            fontSize: 18,
            color: AppColors.darkText,
            height: 1.6,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: AppColors.darkText,
            height: 1.5,
          ),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const TimelineScreen(),
    const PlaylistsScreen(),
    const LetterScreen(),
    const WomenDayScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.cream,
          boxShadow: [
            BoxShadow(
              color: AppColors.accentBlue.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(0, Icons.home_outlined, AppTexts.navHome),
                _buildNavItem(1, Icons.timeline_outlined, AppTexts.navTimeline),
                _buildNavItem(
                    2, Icons.music_note_outlined, AppTexts.navPlaylists),
                _buildNavItem(3, Icons.mail_outline, AppTexts.navLetter),
                _buildNavItem(4, Icons.celebration, AppTexts.navWomenDay),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.lightBlue.withOpacity(0.2)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected
                  ? AppColors.accentBlue
                  : AppColors.darkText.withOpacity(0.5),
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: isSelected
                    ? AppColors.accentBlue
                    : AppColors.darkText.withOpacity(0.5),
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// HOME SCREEN - REDISEÑADA
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Header decorativo
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.accentBlue.withOpacity(0.1),
                    AppColors.skyBlue.withOpacity(0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: AppColors.lightBlue.withOpacity(0.3),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accentBlue.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Decoración superior
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildDecorativeDot(),
                      const SizedBox(width: 8),
                      _buildDecorativeLine(60),
                      const SizedBox(width: 8),
                      Icon(Icons.favorite,
                          color: AppColors.accentBlue, size: 20),
                      const SizedBox(width: 8),
                      _buildDecorativeLine(60),
                      const SizedBox(width: 8),
                      _buildDecorativeDot(),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Título principal con estilo mejorado
                  Text(
                    AppTexts.welcomeTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Pacifico',
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
                  // Subtítulo con decoración
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
                      style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 28,
                        color: AppColors.deepBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Decoración inferior
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildDecorativeDot(),
                      const SizedBox(width: 8),
                      _buildDecorativeLine(100),
                      const SizedBox(width: 8),
                      _buildDecorativeDot(),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Contenido del mensaje
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.accentBlue.withOpacity(0.08),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
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
                    // Decoración final
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
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildDecorativeDot() {
    return Container(
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        color: AppColors.accentBlue,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildDecorativeLine(double width) {
    return Container(
      width: width,
      height: 2,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.accentBlue.withOpacity(0.3),
            AppColors.lightBlue,
            AppColors.accentBlue.withOpacity(0.3),
          ],
        ),
      ),
    );
  }
}

// TIMELINE SCREEN - REDISEÑADA
class TimelineScreen extends StatelessWidget {
  const TimelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // Header con decoración
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.accentBlue.withOpacity(0.15),
                          AppColors.lightBlue.withOpacity(0.1),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: AppColors.accentBlue.withOpacity(0.3),
                        width: 2,
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.history,
                                color: AppColors.accentBlue, size: 28),
                            const SizedBox(width: 12),
                            Text(
                              'Cápsula del Tiempo',
                              style: TextStyle(
                                fontFamily: 'Pacifico',
                                fontSize: 28,
                                color: AppColors.accentBlue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Icon(Icons.access_time,
                                color: AppColors.accentBlue, size: 28),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: AppColors.lightBlue.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            'Nuestros momentos favoritos',
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.deepBlue,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return TimelineTile(
                  item: AppTexts.timelineItems[index],
                  isFirst: index == 0,
                  isLast: index == AppTexts.timelineItems.length - 1,
                );
              },
              childCount: AppTexts.timelineItems.length,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
    );
  }
}

class TimelineTile extends StatelessWidget {
  final TimelineItem item;
  final bool isFirst;
  final bool isLast;

  const TimelineTile({
    super.key,
    required this.item,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline decorativa
          Column(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.lightBlue, AppColors.accentBlue],
                  ),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.accentBlue.withOpacity(0.5),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
              if (!isLast)
                Container(
                  width: 3,
                  height: 240,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.accentBlue,
                        AppColors.lightBlue,
                        AppColors.skyBlue.withOpacity(0.3),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 20),
          // Contenido
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppColors.lightBlue.withOpacity(0.3),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accentBlue.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Badge de fecha
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColors.lightBlue, AppColors.accentBlue],
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.accentBlue.withOpacity(0.3),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      item.date,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Título
                  Row(
                    children: [
                      Icon(Icons.star, color: AppColors.accentBlue, size: 18),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          item.title,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppColors.deepBlue,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ShimmerImage(imageUrl: item.imageUrl),
                  const SizedBox(height: 16),
                  // Descripción con decoración
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.skyBlue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: AppColors.lightBlue.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.format_quote,
                          color: AppColors.accentBlue.withOpacity(0.5),
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            item.description,
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.darkText,
                              height: 1.6,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// SHIMMER IMAGE WIDGET
class ShimmerImage extends StatefulWidget {
  final String imageUrl;

  const ShimmerImage({super.key, required this.imageUrl});

  @override
  State<ShimmerImage> createState() => _ShimmerImageState();
}

class _ShimmerImageState extends State<ShimmerImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _imageLoaded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.lightBlue.withOpacity(0.3),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: AspectRatio(
            aspectRatio: 4 / 3,
            child: Stack(
              children: [
                if (!_imageLoaded)
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              AppColors.skyBlue.withOpacity(0.3),
                              AppColors.lightBlue.withOpacity(0.5),
                              AppColors.skyBlue.withOpacity(0.3),
                            ],
                            stops: [
                              _controller.value - 0.3,
                              _controller.value,
                              _controller.value + 0.3,
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                Image.asset(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  frameBuilder:
                      (context, child, frame, wasSynchronouslyLoaded) {
                    if (wasSynchronouslyLoaded) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (mounted) setState(() => _imageLoaded = true);
                      });
                      return child;
                    }
                    if (frame != null) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (mounted) setState(() => _imageLoaded = true);
                      });
                      return child;
                    }
                    return const SizedBox.shrink();
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppColors.lightBlue.withOpacity(0.3),
                      child: const Center(
                        child: Icon(Icons.broken_image,
                            color: AppColors.accentBlue, size: 40),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// PLAYLISTS SCREEN - REDISEÑADA
class PlaylistsScreen extends StatelessWidget {
  const PlaylistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // Header decorativo
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.accentBlue.withOpacity(0.15),
                          AppColors.lightBlue.withOpacity(0.1),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: AppColors.accentBlue.withOpacity(0.3),
                        width: 2,
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.music_note,
                                color: AppColors.accentBlue, size: 28),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'Canciones que me recuerdan a ti',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Pacifico',
                                  fontSize: 26,
                                  color: AppColors.accentBlue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Icon(Icons.headphones,
                                color: AppColors.accentBlue, size: 28),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: AppColors.lightBlue.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            'Recuerdame en ellas',
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.deepBlue,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return PlaylistCard(playlist: AppTexts.playlists[index]);
                },
                childCount: AppTexts.playlists.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
    );
  }
}

class PlaylistCard extends StatelessWidget {
  final PlaylistItem playlist;

  const PlaylistCard({super.key, required this.playlist});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final uri = Uri.parse(playlist.spotifyUrl);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              AppColors.skyBlue.withOpacity(0.15),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.lightBlue.withOpacity(0.4),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.accentBlue.withOpacity(0.15),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.lightBlue, AppColors.accentBlue],
                ),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.white, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accentBlue.withOpacity(0.4),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  playlist.emoji,
                  style: const TextStyle(fontSize: 36),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    playlist.name,
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: AppColors.deepBlue,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    playlist.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.darkText.withOpacity(0.7),
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.accentBlue,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accentBlue.withOpacity(0.4),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// LETTER SCREEN - REDISEÑADA
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
            // Header decorativo
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.accentBlue.withOpacity(0.15),
                    AppColors.lightBlue.withOpacity(0.1),
                  ],
                ),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: AppColors.accentBlue.withOpacity(0.3),
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  Icon(Icons.mail, color: AppColors.accentBlue, size: 36),
                  const SizedBox(height: 16),
                  Text(
                    AppTexts.letterTitle,
                    style: TextStyle(
                      fontFamily: 'Pacifico',
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
            ),
            const SizedBox(height: 32),
            // Contenido de la carta
            Container(
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: AppColors.lightBlue.withOpacity(0.3),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.accentBlue.withOpacity(0.1),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Decoración superior
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.favorite,
                          color: AppColors.accentBlue.withOpacity(0.3),
                          size: 16),
                      const SizedBox(width: 8),
                      Container(
                        width: 40,
                        height: 2,
                        color: AppColors.lightBlue.withOpacity(0.4),
                      ),
                      const SizedBox(width: 8),
                      Icon(Icons.favorite,
                          color: AppColors.accentBlue, size: 20),
                      const SizedBox(width: 8),
                      Container(
                        width: 40,
                        height: 2,
                        color: AppColors.lightBlue.withOpacity(0.4),
                      ),
                      const SizedBox(width: 8),
                      Icon(Icons.favorite,
                          color: AppColors.accentBlue.withOpacity(0.3),
                          size: 16),
                    ],
                  ),
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
                  // Decoración inferior
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.favorite,
                          color: AppColors.accentBlue.withOpacity(0.3),
                          size: 16),
                      const SizedBox(width: 8),
                      Container(
                        width: 40,
                        height: 2,
                        color: AppColors.lightBlue.withOpacity(0.4),
                      ),
                      const SizedBox(width: 8),
                      Icon(Icons.favorite,
                          color: AppColors.accentBlue, size: 20),
                      const SizedBox(width: 8),
                      Container(
                        width: 40,
                        height: 2,
                        color: AppColors.lightBlue.withOpacity(0.4),
                      ),
                      const SizedBox(width: 8),
                      Icon(Icons.favorite,
                          color: AppColors.accentBlue.withOpacity(0.3),
                          size: 16),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Firma
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
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
