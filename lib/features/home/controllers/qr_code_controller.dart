import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myproject/core/constants/app_durations.dart';
import 'package:myproject/core/utils/bottom_sheet_util.dart';
import 'package:myproject/data/cubits/text_form_field/text_form_field_cubit.dart';
import 'package:myproject/data/cubits/theme_switch/theme_switch_cubit.dart';
import 'package:myproject/features/home/controllers/link_text_field_controller.dart';
import 'package:myproject/features/home/widgets/generated_code_bottom_sheet.dart';
import 'package:myproject/features/home/widgets/qr_image_view.dart';

class QrCodeController {
  static void generateQrCodeAndNavigate(
    BuildContext context,
    TextFormFieldCubit textFormFieldCubit,
    ThemeSwitchCubit themeSwitchCubit,
  ) {
    final Widget qrImageView = CustomQrImageView(
      data: textFormFieldCubit.state.value,
      themeSwitchCubit: themeSwitchCubit,
    );

    final bool isValidated = LinkTextFieldController.validateLink(context, textFormFieldCubit.state.value);

    if (context.canPop() && isValidated) {
      context.pop();
      Future.delayed(AppDurations.duration300ms, () {
        if (!context.mounted) {
          return;
        } else {
          showCustomModalBottomSheet(context, widget: GeneratedCodeBottomSheet(qrImageView: qrImageView));
        }
      });
    } else {
      return;
    }
  }
}
