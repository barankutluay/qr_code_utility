import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/utils/padding_util.dart';
import 'package:myproject/features/home/widgets/scan_button.dart';
import 'package:myproject/features/home/widgets/theme_switch.dart';
import 'package:myproject/features/home/widgets/title_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: PaddingUtil.horizontal(20.r),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(padding: PaddingUtil.onlyTop(20.r), child: TitleText()),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(padding: PaddingUtil.onlyTop(34.r), child: ThemeSwitch()),
              ),
              Align(alignment: Alignment.center, child: ScanButton()),
            ],
          ),
        ),
      ),
    );
  }
}
