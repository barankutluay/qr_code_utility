import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/enums/icon_enum.dart';
import 'package:myproject/core/extensions/icon_enum_extension.dart';
import 'package:myproject/core/utils/bottom_sheet_util.dart';
import 'package:myproject/core/utils/padding_util.dart';
import 'package:myproject/features/home/widgets/generate_qr_code_bottom_sheet.dart';
import 'package:smooth_corner/smooth_corner.dart';

class CreateButton extends StatelessWidget {
  const CreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SmoothContainer(
      child: SizedBox(
        width: 72.r,
        height: 72.r,
        child: IconButton(
          onPressed:
              () => showCustomModalBottomSheet(
                context,
                widget: GenerateQrCodeBottomSheet(),
              ),
          padding: PaddingUtil.zero(),
          alignment: Alignment.center,
          style: Theme.of(context).iconButtonTheme.style,
          icon: _icon(context),
          iconSize: 36.r,
        ),
      ),
    );
  }

  Widget _icon(BuildContext context) {
    return IconEnum.create.toSVGWidget(
      width: 36.r,
      height: 36.r,
      color: Theme.of(context).iconTheme.color,
    );
  }
}
