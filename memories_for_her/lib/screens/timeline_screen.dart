import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants.dart';
import '../theme/app_motion.dart';
import '../widgets/decorative_header.dart';
import '../widgets/section_title.dart';
import '../widgets/timeline_tile.dart';

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
                  DecorativeHeader(
                    child: const SectionTitle(
                      title: 'Cápsula del Tiempo',
                      leadingIcon: Icons.history,
                      trailingIcon: Icons.access_time,
                      subtitleChip: 'Nuestros momentos favoritos',
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return TimelineTile(
                  item: AppTexts.timelineItems[index],
                  index: index,
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
