import 'package:flutter/material.dart';
import 'constants.dart';
import 'screens/home_screen.dart';
import 'screens/letter_screen.dart';
import 'screens/playlists_screen.dart';
import 'screens/timeline_screen.dart';
import 'screens/women_day_screen.dart';
import 'theme/app_motion.dart';
import 'theme/app_theme.dart';
import 'widgets/animated_nav_bar.dart';

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
      theme: AppTheme.light(),
      // Clamp the system font-scale so accessibility text sizing can't
      // break tightly-fit layouts (e.g. the nav bar) on phones that have
      // a large system font size configured.
      builder: (context, child) {
        final mediaQuery = MediaQuery.of(context);
        final clampedScale = mediaQuery.textScaler.scale(1).clamp(1.0, 1.3);
        return MediaQuery(
          data: mediaQuery.copyWith(
            textScaler: TextScaler.linear(clampedScale),
          ),
          child: child!,
        );
      },
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

  final List<Widget> _screens = const [
    HomeScreen(),
    TimelineScreen(),
    PlaylistsScreen(),
    LetterScreen(),
    WomenDayScreen(),
  ];

  static const List<NavBarItemData> _navItems = [
    NavBarItemData(icon: Icons.home_outlined, label: AppTexts.navHome),
    NavBarItemData(icon: Icons.timeline_outlined, label: AppTexts.navTimeline),
    NavBarItemData(icon: Icons.music_note_outlined, label: AppTexts.navPlaylists),
    NavBarItemData(icon: Icons.mail_outline, label: AppTexts.navLetter),
    NavBarItemData(icon: Icons.celebration, label: AppTexts.navWomenDay),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: AppMotion.base,
        switchInCurve: AppMotion.curve,
        switchOutCurve: AppMotion.curveOut,
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.02),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },
        child: KeyedSubtree(
          key: ValueKey(_currentIndex),
          child: _screens[_currentIndex],
        ),
      ),
      bottomNavigationBar: AnimatedNavBar(
        items: _navItems,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
