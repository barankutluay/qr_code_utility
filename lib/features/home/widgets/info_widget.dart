import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_utility/core/constants/app_strings.dart';
import 'package:qr_code_utility/core/enums/icon_enum.dart';
import 'package:qr_code_utility/core/extensions/icon_enum_extension.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 4.r,
      children: [
        IconEnum.info.toSVGWidget(
          context,
          width: 24.r,
          height: 24.r,
          color: Theme.of(
            context,
          ).textTheme.bodyMedium!.color!.withValues(alpha: 0.5),
        ),
        Text(
          AppStrings.generateQrCodeBottomSheetInfoText,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(
              context,
            ).textTheme.bodyMedium!.color!.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }
}
