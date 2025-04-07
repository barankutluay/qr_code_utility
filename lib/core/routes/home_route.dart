import 'dart:ui';

import 'package:go_router/go_router.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/constants/app_durations.dart';
import 'package:myproject/core/transitions/app_transitions.dart';
import 'package:myproject/features/home/screens/home_screen.dart';

final GoRoute homeRoute = GoRoute(
  path: '/',
  name: 'home',
  pageBuilder:
      (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const HomeScreen(),
        barrierColor: AppColors.black50,
        transitionDuration: AppDurations.duration1000ms,
        reverseTransitionDuration: AppDurations.duration1000ms,
        transitionsBuilder:
            (context, primaryAnimation, secondaryAnimation, child) =>
                AppTransitions.buildScaleThenSlideTransition(
                  primaryAnimation: primaryAnimation,
                  secondaryAnimation: secondaryAnimation,
                  child: child,
                  begin: Offset.zero,
                  end: const Offset(-0.25, 0),
                  useSecondary: true,
                ),
      ),
);
