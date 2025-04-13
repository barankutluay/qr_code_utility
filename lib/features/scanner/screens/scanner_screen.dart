import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_utility/core/constants/app_colors.dart';
import 'package:qr_code_utility/data/cubits/scanner/scanner_cubit.dart';
import 'package:qr_code_utility/features/scanner/screens/scanner_screen_layout.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => ScannerCubit()..scanningStarted(),
    child: const Scaffold(
      body: ScannerScreenLayout(),
      backgroundColor: AppColors.black,
    ),
  );
}
