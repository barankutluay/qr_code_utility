import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/utils/padding_util.dart';
import 'package:myproject/data/cubits/history/history_cubit.dart';
import 'package:myproject/features/history/widgets/generated_history_card.dart';
import 'package:myproject/features/history/widgets/scanned_history_card.dart';

final class HistoryController {
  HistoryController._();
  static final HistoryController instance = HistoryController._();

  static HistoryCubit Function(BuildContext context) read = (context) {
    return context.read<HistoryCubit>();
  };

  static HistoryCubit Function(BuildContext context) watch = (context) {
    return context.watch<HistoryCubit>();
  };

  static Widget bodyBuilder(BuildContext context, HistoryState state) {
    if (state is HistoryLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state is HistoryLoaded) {
      return ListView.builder(
        padding: PaddingUtil.horizontalAndVertical(20.r, 24.r),
        itemCount: state.historyList.length,
        itemBuilder: (context, index) {
          final repaintKey = GlobalKey();
          if (state.historyList[index].type == 0) {
            return GeneratedHistoryCard(
              dateString: state.historyList[index].formattedTime,
              url: state.historyList[index].url,
              repaintKey: repaintKey,
            );
          } else if (state.historyList[index].type == 1) {
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
  }
}
