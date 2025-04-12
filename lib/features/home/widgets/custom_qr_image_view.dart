import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/utils/padding_util.dart';
import 'package:myproject/features/home/controllers/theme_switch_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CustomQrImageView extends StatelessWidget {
  const CustomQrImageView({
    required this.data,
    required this.repaintKey,
    super.key,
  });

  final String data;
  final GlobalKey repaintKey;

  @override
  Widget build(BuildContext context) {
    final themeSwitchController = ThemeSwitchController.read(context);
    final boxDecoration = BoxDecoration(
      border: Border.all(
        width: 1.r,
        strokeAlign: BorderSide.strokeAlignOutside,
        color:
            themeSwitchController.state.isDarkMode
                ? AppColors.lightOutline
                : AppColors.darkOutline,
      ),
    );

    return RepaintBoundary(
      key: repaintKey,
      child: Container(
        width: 150.r,
        height: 150.r,
        decoration: boxDecoration,
        child: QrImageView(
          data: data,
          size: 150.r,
          padding: PaddingUtil.all(8.r),
          backgroundColor: AppColors.white,
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('data', data))
      ..add(
        DiagnosticsProperty<GlobalKey<State<StatefulWidget>>>(
          'repaintKey',
          repaintKey,
        ),
      );
  }
}
