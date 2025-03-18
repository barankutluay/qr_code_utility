import 'package:flutter/material.dart';
import 'package:myproject/core/animations/app_bottom_sheet_animation.dart';
import 'package:myproject/features/home/widgets/create_button_bottom_sheet.dart';

Future<dynamic> showCreateButtonBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    useSafeArea: true,
    isDismissible: true,
    isScrollControlled: false,
    enableDrag: false,
    sheetAnimationStyle: AppBottomSheetAnimation.animationStyle,
    constraints: const BoxConstraints(maxWidth: double.infinity),
    builder: (context) => const CreateButtonBottomSheet(),
  );
}
