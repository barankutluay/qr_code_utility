import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/utils/build_when_util.dart';
import 'package:myproject/core/utils/padding_util.dart';
import 'package:myproject/data/cubits/text_form_field/text_form_field_cubit.dart';
import 'package:myproject/features/home/controllers/generate_qr_code_controller.dart';
import 'package:myproject/features/home/widgets/buttons/generate_button.dart';
import 'package:myproject/features/home/widgets/generate_qr_code_bottom_sheet/generate_qr_code_bottom_sheet_title.dart';
import 'package:myproject/features/home/widgets/info_widget.dart';
import 'package:myproject/features/home/widgets/link_text_field.dart';
import 'package:smooth_corner/smooth_corner.dart';

class GenerateQrCodeBottomSheet extends StatelessWidget {
  GenerateQrCodeBottomSheet({super.key});

  final GlobalKey repaintKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TextFormFieldCubit(),
      child: BlocBuilder<TextFormFieldCubit, TextFormFieldState>(
        buildWhen: buildWhen,
        builder: (context, state) {
          return SmoothContainer(
            width: double.infinity,
            child: Padding(
              padding: PaddingUtil.horizontalAndVertical(20.r, 24.r),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const GenerateQrCodeBottomSheetTitle(),
                  16.verticalSpacingRadius,
                  const InfoWidget(),
                  16.verticalSpacingRadius,
                  const LinkTextField(),
                  24.verticalSpacingRadius,
                  GenerateButton(
                    onPressed: () {
                      GenerateQrCodeController.handleOnPressed(
                        context,
                        repaintKey,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
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
