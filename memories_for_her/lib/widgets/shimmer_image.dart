import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants.dart';
import '../theme/app_motion.dart';

/// Image with a shimmering placeholder shown while the asset frame loads.
class ShimmerImage extends StatefulWidget {
  final String imageUrl;

  const ShimmerImage({super.key, required this.imageUrl});

  @override
  State<ShimmerImage> createState() => _ShimmerImageState();
}

class _ShimmerImageState extends State<ShimmerImage> {
  bool _imageLoaded = false;

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
                  Container(
                    color: AppColors.lightBlue.withOpacity(0.3),
                  )
                      .animate(onPlay: (controller) => controller.repeat())
                      .shimmer(
                        duration: AppMotion.slow * 3,
                        color: AppColors.skyBlue.withOpacity(0.6),
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
