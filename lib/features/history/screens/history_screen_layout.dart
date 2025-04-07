import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_colors.dart';
import 'package:myproject/core/utils/padding_util.dart';
import 'package:myproject/data/cubits/history/history_cubit.dart';
import 'package:myproject/features/history/widgets/backward_button.dart';
import 'package:myproject/features/history/widgets/scanned_history_card.dart';
import 'package:myproject/features/history/widgets/history_title.dart';

class HistoryScreenLayout extends StatefulWidget {
  const HistoryScreenLayout({super.key});

  @override
  State<HistoryScreenLayout> createState() => _HistoryScreenLayoutState();
}

class _HistoryScreenLayoutState extends State<HistoryScreenLayout> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async => context.read<HistoryCubit>().getHistory(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
    child: NestedScrollView( // TODO: implement scroll refresh
      headerSliverBuilder: // TODO: implement clear history button
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
      body: BlocBuilder<HistoryCubit, HistoryState>(
        builder: (context, state) {
          if (state is HistoryLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is HistoryLoaded) {
            return ListView.builder(
              padding: PaddingUtil.horizontalAndVertical(20.r, 24.r),
              itemCount: state.historyList.length,
              itemBuilder: (context, index) {
                if (state.historyList[index].type == 0) {
                  // TODO: implement history generated card
                }
                if (state.historyList[index].type == 1) {
                  return ScannedHistoryCard(
                    dateString: state.historyList[index].formattedTime,
                    url: state.historyList[index].url,
                  );
                }
                return null;
              },
            );
          }
          return Padding(
            padding: PaddingUtil.horizontal(20.r),
            child: Center(
              child: Text(
                'History is empty',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          );
        },
      ),
    ),
  );
}
