import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/constants/app_durations.dart';
import 'package:myproject/core/utils/bottom_sheet_util.dart';
import 'package:myproject/core/utils/padding_util.dart';
import 'package:myproject/data/cubits/text_form_field/text_form_field_cubit.dart';
import 'package:myproject/data/cubits/theme_switch/theme_switch_cubit.dart';
import 'package:myproject/features/home/widgets/generated_code_bottom_sheet.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeController {
  static Widget qrImageView({required String data, required ThemeSwitchCubit themeSwitchCubit}) {
    return SizedBox(
      width: 200.r,
      height: 200.r,
      child: QrImageView(
        data: data,
        size: 200.r,
        version: QrVersions.auto,
        errorCorrectionLevel: QrErrorCorrectLevel.L,
        gapless: true,
        padding: PaddingUtil.zero(),
        constrainErrorBounds: true,
        backgroundColor: AppColors.transparent,
        dataModuleStyle: QrDataModuleStyle(
          dataModuleShape: QrDataModuleShape.square,
          color: themeSwitchCubit.state.isDarkMode ? AppColors.darkOnSurface : AppColors.lightOnSurface,
        ),
        eyeStyle: QrEyeStyle(
          eyeShape: QrEyeShape.square,
          color: themeSwitchCubit.state.isDarkMode ? AppColors.darkOnSurface : AppColors.lightOnSurface,
        ),
      ),
    );
  }

  static void generateQrCodeAndNavigate(
    BuildContext context,
    TextFormFieldCubit textFormFieldCubit,
    ThemeSwitchCubit themeSwitchCubit,
  ) {
    Widget qrImageView = QrCodeController.qrImageView(
      data: textFormFieldCubit.state.value,
      themeSwitchCubit: themeSwitchCubit,
    );
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
      Future.delayed(AppDurations.duration150ms, () {
        if (!context.mounted) return;
        showCustomModalBottomSheet(context, widget: GeneratedCodeBottomSheet(qrImageView: qrImageView));
      });
    }
  }
}
