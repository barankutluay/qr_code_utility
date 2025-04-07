import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/utils/padding_util.dart';
import 'package:myproject/features/history/widgets/backward_button.dart';
import 'package:myproject/features/history/widgets/history_scanned_card.dart';
import 'package:myproject/features/history/widgets/history_title.dart';

class HistoryScreenLayout extends StatelessWidget {
  const HistoryScreenLayout({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
    child: NestedScrollView(
      headerSliverBuilder:
          (context, innerBoxIsScrolled) => [
            SliverAppBar(
              floating: true,
              snap: true,
              centerTitle: true,
              elevation: innerBoxIsScrolled ? 2.r : 0,
              titleSpacing: 0,
              toolbarHeight: 88.r,
              leadingWidth: 68.r,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              surfaceTintColor: AppColors.transparent,
              shadowColor: AppColors.shadowColor,
              leading: Padding(
                padding: PaddingUtil.only(20.r, 0, 20.r, 20.r),
                child: const BackwardButton(),
              ),
              title: const HistoryTitle(),
            ),
          ],
      body: ListView.builder(
        padding: PaddingUtil.horizontalAndVertical(20.r, 24.r),
        itemCount: 1,
        itemBuilder:
            (context, index) => const HistoryScannedCard(
              dateString: '26.02.2025 14:29:29',
              url: 'https://www.youtube.com/watch?v=dQw4w9WgXc',
            ),
      ),
    ),
  );
}
