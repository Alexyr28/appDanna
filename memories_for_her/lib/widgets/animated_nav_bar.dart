import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants.dart';
import '../theme/app_motion.dart';

class NavBarItemData {
  final IconData icon;
  final String label;

  const NavBarItemData({required this.icon, required this.label});
}

/// The app's bottom navigation bar: animated selection pill per item plus
/// a subtle scale-pop on the selected icon.
class AnimatedNavBar extends StatelessWidget {
  final List<NavBarItemData> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AnimatedNavBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              for (var i = 0; i < items.length; i++)
                _NavItem(
                  data: items[i],
                  isSelected: currentIndex == i,
                  onTap: () => onTap(i),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final NavBarItemData data;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.data,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: AppMotion.fast,
        curve: AppMotion.curve,
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
              data.icon,
              color: isSelected
                  ? AppColors.accentBlue
                  : AppColors.darkText.withOpacity(0.5),
              size: 24,
            )
                .animate(target: isSelected ? 1 : 0)
                .scaleXY(end: 1.08, curve: AppMotion.curve, duration: AppMotion.fast),
            const SizedBox(height: 4),
            AnimatedDefaultTextStyle(
              duration: AppMotion.fast,
              curve: AppMotion.curve,
              style: TextStyle(
                fontSize: 11,
                color: isSelected
                    ? AppColors.accentBlue
                    : AppColors.darkText.withOpacity(0.5),
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
              child: Text(data.label),
            ),
          ],
        ),
      ),
    );
  }
}
