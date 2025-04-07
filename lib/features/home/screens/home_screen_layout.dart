import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/utils/padding_util.dart';
import 'package:myproject/features/home/widgets/create_button.dart';
import 'package:myproject/features/home/widgets/history_button.dart';
import 'package:myproject/features/home/widgets/home_title.dart';
import 'package:myproject/features/home/widgets/scan_button.dart';
import 'package:myproject/features/home/widgets/theme_switch.dart';

class HomeScreenLayout extends StatelessWidget {
  const HomeScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: PaddingUtil.horizontal(20.r),
        child: Stack(
          alignment: Alignment.center,
          children: [_title(), _themeSwitch(), _scanButton(), _bottomButtons()],
        ),
      ),
    );
  }

  Align _title() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: PaddingUtil.onlyTop(20.r),
        child: const HomeTitle(),
      ),
    );
  }

  Align _themeSwitch() {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: PaddingUtil.onlyTop(34.r),
        child: const ThemeSwitch(),
      ),
    );
  }

  Align _scanButton() {
    return const Align(alignment: Alignment.center, child: ScanButton());
  }

  Align _bottomButtons() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: PaddingUtil.onlyBottom(32.r),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 25.r,
          children: [const HistoryButton(), const CreateButton()],
        ),
      ),
    );
  }
}
