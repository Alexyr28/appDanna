import 'package:flutter/animation.dart';

/// Shared animation timing so every screen/widget feels consistent.
class AppMotion {
  AppMotion._();

  static const Duration fast = Duration(milliseconds: 150);
  static const Duration base = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 450);

  static const Curve curve = Curves.easeOutCubic;
  static const Curve curveOut = Curves.easeInCubic;

  static const Duration staggerStep = Duration(milliseconds: 70);
}
