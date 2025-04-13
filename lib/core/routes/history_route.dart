import 'dart:ui';

import 'package:go_router/go_router.dart';
import 'package:qr_code_utility/core/constants/app_colors.dart';
import 'package:qr_code_utility/core/constants/app_durations.dart';
import 'package:qr_code_utility/core/transitions/app_transitions.dart';
import 'package:qr_code_utility/features/history/screens/history_screen.dart';

final GoRoute historyRoute = GoRoute(
  path: '/history',
  name: 'history',
  pageBuilder: (context, state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: const HistoryScreen(),
      barrierColor: AppColors.black75,
      transitionDuration: AppDurations.duration500ms,
      reverseTransitionDuration: AppDurations.duration500ms,
      transitionsBuilder: (
        context,
        primaryAnimation,
        secondaryAnimation,
        child,
      ) {
        return AppTransitions.buildScaleThenSlideTransition(
          primaryAnimation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          child: child,
          begin: const Offset(1, 0),
          end: Offset.zero,
        );
      },
    );
  },
);
