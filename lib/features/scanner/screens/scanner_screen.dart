import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/data/cubits/scanner/scanner_cubit.dart';
import 'package:myproject/features/scanner/controllers/scanner_controller.dart';
import 'package:myproject/features/scanner/screens/scanner_screen_layout.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  final controllerInstance = ScannerController.instance;

  @override
  Future<void> initState() async {
    super.initState();
    await controllerInstance.controller.start();
  }

  @override
  Future<void> dispose() async {
    await controllerInstance.controller.stop().then(
      (_) => controllerInstance.controller.dispose(),
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => ScannerCubit()..scanningStarted(),
    child: BlocBuilder<ScannerCubit, ScannerState>(
      builder:
          (context, state) => Scaffold(
            body: ScannerScreenLayout(controllerInstance: controllerInstance),
            backgroundColor: AppColors.black,
          ),
    ),
  );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<ScannerController>(
        'controllerInstance',
        controllerInstance,
      ),
    );
  }
}
