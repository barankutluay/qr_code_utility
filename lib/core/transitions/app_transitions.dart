import 'package:flutter/material.dart';
import 'package:myproject/core/constants/app_durations.dart';

final class AppTransitions {
  const AppTransitions._();

  static CurvedAnimation _buildCurvedAnimation({
    required Animation<double> primaryAnimation,
    required Animation<double> secondaryAnimation,
    bool useSecondary = false,
    Curve curve = Curves.easeOutQuad,
  }) => CurvedAnimation(
    parent: useSecondary ? secondaryAnimation : primaryAnimation,
    curve: curve,
  );

  static Widget buildSlideTransition({
    required Animation<double> primaryAnimation,
    required Animation<double> secondaryAnimation,
    required Widget child,
    required Offset begin,
    required Offset end,
    Curve curve = Curves.easeOutQuad,
    bool useSecondary = false,
  }) {
    final CurvedAnimation animation = _buildCurvedAnimation(
      primaryAnimation: primaryAnimation,
      secondaryAnimation: secondaryAnimation,
      useSecondary: useSecondary,
      curve: curve,
    );
    final Tween<Offset> tween = Tween<Offset>(begin: begin, end: end);
    return SlideTransition(position: tween.animate(animation), child: child);
  }

  static Widget buildScaleThenSlideTransition({
    required Animation<double> primaryAnimation,
    required Animation<double> secondaryAnimation,
    required Widget child,
    required Offset begin,
    required Offset end,
    Curve curve = Curves.easeOutQuad,
    bool useSecondary = false,
    Duration totalDuration = AppDurations.duration1000ms,
    Duration slideDelay = AppDurations.duration500ms,
  }) {
    const double beginScale = 1.0;
    final double endScale = useSecondary ? 0.90 : 1.0;

    final CurvedAnimation parentAnimation = _buildCurvedAnimation(
      primaryAnimation: primaryAnimation,
      secondaryAnimation: secondaryAnimation,
      useSecondary: useSecondary,
      curve: curve,
    );

    final double delayFraction =
        slideDelay.inMilliseconds / totalDuration.inMilliseconds;

    final CurvedAnimation slideAnimation = CurvedAnimation(
      parent: parentAnimation,
      curve: Interval(delayFraction, 1.0, curve: curve),
    );

    final Tween<Offset> slideTween = Tween<Offset>(begin: begin, end: end);

    final SlideTransition slideTransition = SlideTransition(
      position: slideTween.animate(slideAnimation),
      child: child,
    );

    final Tween<double> scaleTween = Tween<double>(
      begin: beginScale,
      end: endScale,
    );

    return ScaleTransition(
      scale: scaleTween.animate(parentAnimation),
      child: slideTransition,
    );
  }
}
