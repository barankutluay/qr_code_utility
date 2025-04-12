import 'dart:ui';

import 'package:go_router/go_router.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/constants/app_durations.dart';
import 'package:myproject/core/transitions/app_transitions.dart';
import 'package:myproject/features/history/screens/history_screen.dart';

final GoRoute historyRoute = GoRoute(
  path: '/history',
  name: 'history',
  pageBuilder: (context, state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: const HistoryScreen(),
      barrierColor: AppColors.black50,
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
