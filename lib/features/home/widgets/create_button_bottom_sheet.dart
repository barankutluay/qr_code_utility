import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/utils/padding_util.dart';
import 'package:myproject/features/home/widgets/create_button_bottom_sheet_text_form_field.dart';
import 'package:myproject/features/home/widgets/generate_button.dart';
import 'package:smooth_corner/smooth_corner.dart';

class CreateButtonBottomSheet extends StatelessWidget {
  const CreateButtonBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SmoothContainer(
      width: double.infinity,
      height: 235.r,
      child: Padding(
        padding: PaddingUtil.horizontalAndVertical(20.r, 24.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Generate QR Code",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
            ),
            32.verticalSpacingRadius,
            CreateButtonBottomSheetTextFormField(),
            32.verticalSpacingRadius,
            GenerateButton(),
          ],
        ),
      ),
    );
  }
}
