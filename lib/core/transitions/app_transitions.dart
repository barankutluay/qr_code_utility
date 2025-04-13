import 'package:flutter/material.dart';
import 'package:qr_code_utility/core/constants/app_durations.dart';

final class AppTransitions {
  const AppTransitions._();

  static CurvedAnimation _buildCurvedAnimation({
    required Animation<double> primaryAnimation,
    required Animation<double> secondaryAnimation,
    Curve curve = Curves.easeOutQuad,
    bool useSecondary = false,
  }) {
    return CurvedAnimation(
      parent: useSecondary ? secondaryAnimation : primaryAnimation,
      curve: curve,
    );
  }

  static Widget buildSlideTransition({
    required Animation<double> primaryAnimation,
    required Animation<double> secondaryAnimation,
    required Widget child,
    required Offset begin,
    required Offset end,
    Curve curve = Curves.easeOutQuad,
    bool useSecondary = false,
  }) {
    final animation = _buildCurvedAnimation(
      primaryAnimation: primaryAnimation,
      secondaryAnimation: secondaryAnimation,
      useSecondary: useSecondary,
      curve: curve,
    );

    final tween = Tween<Offset>(begin: begin, end: end);

    return SlideTransition(position: tween.animate(animation), child: child);
  }

  static Widget buildScaleThenSlideTransition({
    required Animation<double> primaryAnimation,
    required Animation<double> secondaryAnimation,
    required Widget child,
    required Offset begin,
    required Offset end,
    Duration totalDuration = AppDurations.duration500ms,
    Duration slideDelay = AppDurations.duration300ms,
    Curve curve = Curves.easeOutQuad,
    bool useSecondary = false,
  }) {
    const beginScale = 1.0;
    final endScale = useSecondary ? 0.90 : 1.0;
    final delay = slideDelay.inMilliseconds / totalDuration.inMilliseconds;
    final slideTween = Tween<Offset>(begin: begin, end: end);
    final scaleTween = Tween<double>(begin: beginScale, end: endScale);

    final parentAnimation = _buildCurvedAnimation(
      primaryAnimation: primaryAnimation,
      secondaryAnimation: secondaryAnimation,
      useSecondary: useSecondary,
      curve: curve,
    );

    final slideAnimation = CurvedAnimation(
      parent: parentAnimation,
      curve: Interval(delay, 1, curve: curve),
    );

    final slideTransition = SlideTransition(
      position: slideTween.animate(slideAnimation),
      child: child,
    );

    return ScaleTransition(
      scale: scaleTween.animate(parentAnimation),
      filterQuality: FilterQuality.low,
      child: slideTransition,
    );
  }
}
