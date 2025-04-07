import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/utils/padding_util.dart';
import 'package:myproject/data/cubits/theme_switch/theme_switch_cubit.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CustomQrImageView extends StatelessWidget {
  const CustomQrImageView({
    required this.data,
    required this.themeSwitchCubit,
    required this.repaintKey,
    super.key,
  });

  final String data;
  final ThemeSwitchCubit themeSwitchCubit;
  final GlobalKey repaintKey;

  @override
  Widget build(BuildContext context) {
    final boxDecoration = BoxDecoration(
      border: Border.all(
        width: 1.r,
        color:
            themeSwitchCubit.state.isDarkMode
                ? AppColors.lightOutline
                : AppColors.darkOutline,
      ),
    );

    return RepaintBoundary(
      key: repaintKey,
      child: Container(
        width: 200.r,
        height: 200.r,
        decoration: boxDecoration,
        child: QrImageView(
          data: data,
          size: 200.r,
          errorCorrectionLevel: QrErrorCorrectLevel.H,
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
        DiagnosticsProperty<ThemeSwitchCubit>(
          'themeSwitchCubit',
          themeSwitchCubit,
        ),
      )
      ..add(
        DiagnosticsProperty<GlobalKey<State<StatefulWidget>>>(
          'repaintKey',
          repaintKey,
        ),
      );
  }
}
