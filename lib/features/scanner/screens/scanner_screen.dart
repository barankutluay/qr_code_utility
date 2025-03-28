import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/data/cubits/scanner/scanner_cubit.dart';
import 'package:myproject/features/scanner/controllers/scanner_controller.dart';
import 'package:myproject/features/scanner/widgets/scanner_screen_layout.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  @override
  void initState() {
    super.initState();
    ScannerController.controller.start();
  }

  @override
  void dispose() {
    ScannerController.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScannerCubit()..scanningStarted(),
      child: BlocBuilder<ScannerCubit, ScannerState>(
        builder: (context, state) {
          return Scaffold(body: ScannerScreenLayout(), backgroundColor: AppColors.black);
        },
      ),
    );
  }
}
