import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';

Future<void> showCustomDialog(BuildContext context, Widget widget) async {
  await showDialog(
    context: context,
    barrierColor: AppColors.black50,
    anchorPoint: const Offset(0.5, 0.5),
    builder: (context) {
      return Dialog(
        alignment: Alignment.center,
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.all(20.r),
        child: widget,
      );
    },
  );
}
