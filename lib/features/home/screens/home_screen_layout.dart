import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/utils/padding_util.dart';
import 'package:myproject/features/home/controllers/create_button_controller.dart';
import 'package:myproject/features/home/controllers/history_button_controller.dart';
import 'package:myproject/features/home/widgets/buttons/create_button.dart';
import 'package:myproject/features/home/widgets/buttons/history_button.dart';
import 'package:myproject/features/home/widgets/buttons/scan_button.dart';
import 'package:myproject/features/home/widgets/home_title.dart';
import 'package:myproject/features/home/widgets/theme_switch.dart';
import 'package:myproject/features/scanner/controllers/scanner_controller.dart';

class HomeScreenLayout extends StatelessWidget {
  const HomeScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: PaddingUtil.horizontal(20.r),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: PaddingUtil.onlyTop(20.r),
                child: const HomeTitle(),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: PaddingUtil.onlyTop(34.r),
                child: const ThemeSwitch(),
              ),
            ),
            Align(
              child: ScanButton(
                onPressed: () {
                  ScannerController.handleOnPressed(context);
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: PaddingUtil.onlyBottom(32.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 25.r,
                  children: [
                    HistoryButton(
                      onPressed: () {
                        HistoryButtonController.handleOnPressed(context);
                      },
                    ),
                    CreateButton(
                      onPressed: () {
                        CreateButtonController.handleOnPressed(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
