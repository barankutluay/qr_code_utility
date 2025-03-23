import 'package:flutter/material.dart';
import 'package:myproject/core/constants/app_durations.dart';
import 'package:myproject/core/utils/bottom_sheet_util.dart';
import 'package:myproject/core/utils/navigator_util.dart';
import 'package:myproject/data/cubits/text_form_field/text_form_field_cubit.dart';
import 'package:myproject/data/cubits/theme_switch/theme_switch_cubit.dart';
import 'package:myproject/features/home/widgets/generated_code_bottom_sheet.dart';
import 'package:myproject/features/home/widgets/qr_image_view.dart';

class QrCodeController {
  static void generateQrCodeAndNavigate(
    BuildContext context,
    TextFormFieldCubit textFormFieldCubit,
    ThemeSwitchCubit themeSwitchCubit,
  ) {
    Widget qrImageView = CustomQrImageView(data: textFormFieldCubit.state.value, themeSwitchCubit: themeSwitchCubit);
    if (Navigator.canPop(context)) {
      NavigatorUtil.pop(context); //TODO: GoRouter migrate
      Future.delayed(AppDurations.duration150ms, () {
        if (!context.mounted) {
          return; //TODO: Snackbar aç
        } else {
          showCustomModalBottomSheet(context, widget: GeneratedCodeBottomSheet(qrImageView: qrImageView));
        }
      });
    } else {
      throw Exception("Can't navigate back"); //TODO: Snackbara çevir
    }
  }
}
