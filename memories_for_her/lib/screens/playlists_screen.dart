import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants.dart';
import '../theme/app_motion.dart';
import '../widgets/decorative_header.dart';
import '../widgets/playlist_card.dart';
import '../widgets/section_title.dart';

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
                  DecorativeHeader(
                    child: const SectionTitle(
                      title: 'Canciones que me recuerdan a ti',
                      titleFontSize: 26,
                      leadingIcon: Icons.music_note,
                      trailingIcon: Icons.headphones,
                      subtitleChip: 'Recuerdame en ellas',
                    ),
                  )
                      .animate()
                      .fadeIn(duration: AppMotion.base, curve: AppMotion.curve)
                      .slideY(begin: 0.06, end: 0, duration: AppMotion.base, curve: AppMotion.curve),
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
                  return PlaylistCard(
                    playlist: AppTexts.playlists[index],
                    index: index,
                  );
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
