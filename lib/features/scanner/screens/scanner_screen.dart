import 'package:flutter/material.dart';
import 'package:myproject/features/scanner/widgets/scanner_screen_layout.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ScannerScreenLayout());
  }
}
