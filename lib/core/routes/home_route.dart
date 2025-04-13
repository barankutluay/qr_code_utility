import 'dart:ui';

import 'package:go_router/go_router.dart';
import 'package:qr_code_utility/core/constants/app_colors.dart';
import 'package:qr_code_utility/core/constants/app_durations.dart';
import 'package:qr_code_utility/core/transitions/app_transitions.dart';
import 'package:qr_code_utility/features/home/screens/home_screen.dart';

final GoRoute homeRoute = GoRoute(
  path: '/',
  name: 'home',
  pageBuilder: (context, state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: const HomeScreen(),
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
          begin: Offset.zero,
          end: const Offset(-0.25, 0),
          useSecondary: true,
        );
      },
    );
  },
);
