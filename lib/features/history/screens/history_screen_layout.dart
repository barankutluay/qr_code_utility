import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/utils/build_when_util.dart';
import 'package:myproject/core/utils/padding_util.dart';
import 'package:myproject/data/cubits/history/history_cubit.dart';
import 'package:myproject/features/history/controllers/history_controller.dart';
import 'package:myproject/features/history/widgets/backward_button.dart';
import 'package:myproject/features/history/widgets/history_title.dart';

class HistoryScreenLayout extends StatelessWidget {
  const HistoryScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final historyCubit = HistoryController.read(context);
    unawaited(historyCubit.getHistory());

    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
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
            ),
          ];
        },
        body: const BlocBuilder<HistoryCubit, HistoryState>(
          buildWhen: buildWhen,
          builder: HistoryController.bodyBuilder,
        ),
      ),
    );
  }
}
