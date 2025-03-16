import 'package:flutter/widgets.dart';
import 'package:myproject/core/constants/app_durations.dart';

class AppBottomSheetAnimation {
  static AnimationStyle animationStyle = AnimationStyle(
    curve: Curves.easeOutQuad,
    duration: AppDurations.duration300ms,
    reverseCurve: Curves.easeOutQuad,
    reverseDuration: AppDurations.duration300ms,
  );
}
