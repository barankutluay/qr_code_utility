import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:myproject/core/constants/app_colors.dart';

class ScannerScreenLayout extends StatelessWidget {
  const ScannerScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MobileScanner(
        controller: MobileScannerController(),
        placeholderBuilder: (p0, p1) => Container(color: AppColors.black),
      ),
    );
  }
}
