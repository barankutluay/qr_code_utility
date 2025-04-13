import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code_utility/core/constants/app_colors.dart';
import 'package:qr_code_utility/core/utils/padding_util.dart';
import 'package:qr_code_utility/features/history/controllers/history_controller.dart';
import 'package:qr_code_utility/features/history/widgets/backward_button.dart';
import 'package:qr_code_utility/features/history/widgets/clear_history_button.dart';
import 'package:qr_code_utility/features/history/widgets/history_title.dart';

class HistoryAppBar extends StatelessWidget {
  const HistoryAppBar({required this.innerBoxIsScrolled, super.key});

  final bool innerBoxIsScrolled;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      floating: true,
      snap: true,
      elevation: innerBoxIsScrolled ? 2.r : 0,
      titleSpacing: 0,
      toolbarHeight: 88.r,
      leadingWidth: 68.r,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shadowColor: Theme.of(context).shadowColor,
      surfaceTintColor: AppColors.transparent,
      title: const HistoryTitle(),
      leading: Padding(
        padding: PaddingUtil.only(20.r, 0, 20.r, 20.r),
        child: BackwardButton(onPressed: context.pop),
      ),
      actions: [
        Padding(
          padding: PaddingUtil.only(20.r, 20.r, 20.r, 0),
          child: ClearHistoryButton(
            onPressed: () => HistoryController.clearHistory(context),
          ),
        ),
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<bool>('innerBoxIsScrolled', innerBoxIsScrolled),
    );
  }
}
