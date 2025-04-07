import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_strings.dart';
import 'package:myproject/features/home/controllers/generate_qr_code_controller.dart';
import 'package:myproject/features/home/controllers/link_text_field_controller.dart';
import 'package:myproject/features/home/controllers/theme_switch_controller.dart';
import 'package:smooth_corner/smooth_corner.dart';

class GenerateButton extends StatelessWidget {
  const GenerateButton({required this.repaintKey, super.key});

  final GlobalKey repaintKey;

  @override
  Widget build(BuildContext context) {
    final themeSwitchCubit = ThemeSwitchController.watch(context);
    final textFormFieldCubit = LinkTextFieldController.watch(context);

    return SmoothContainer(
      width: double.infinity,
      height: 48.r,
      child: ElevatedButton(
        onPressed:
            () async => GenerateQrCodeController.generateQrCodeAndNavigate(
              context,
              textFormFieldCubit,
              themeSwitchCubit,
              repaintKey,
            ),
        style: Theme.of(context).elevatedButtonTheme.style,
        child: const Text(AppStrings.generateButtonText),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<GlobalKey<State<StatefulWidget>>>(
        'repaintKey',
        repaintKey,
      ),
    );
  }
}
