import 'dart:ui';

import 'package:go_router/go_router.dart';
import 'package:qr_code_utility/core/constants/app_colors.dart';
import 'package:qr_code_utility/core/constants/app_durations.dart';
import 'package:qr_code_utility/core/transitions/app_transitions.dart';
import 'package:qr_code_utility/features/scanner/screens/scanner_screen.dart';

final GoRoute scannerRoute = GoRoute(
  path: '/scanner',
  name: 'scanner',
  pageBuilder: (context, state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: const ScannerScreen(),
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
