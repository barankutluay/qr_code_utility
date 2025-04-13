import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/core/utils/share_util.dart';
import 'package:myproject/data/cubits/history/history_cubit.dart';
import 'package:myproject/features/history/widgets/history_empty_widget.dart';
import 'package:myproject/features/history/widgets/history_loaded_widget.dart';
import 'package:myproject/features/history/widgets/history_loading_widget.dart';
import 'package:myproject/features/home/controllers/generate_qr_code_controller.dart';

final class HistoryController {
  HistoryController._();
  static final HistoryController instance = HistoryController._();

  static HistoryCubit Function(BuildContext context) read = (context) {
    return context.read<HistoryCubit>();
  };

  static HistoryCubit Function(BuildContext context) watch = (context) {
    return context.watch<HistoryCubit>();
  };

  static void clearHistory(BuildContext context) {
    unawaited(read(context).clearHistory(context));
  }

  static void shareUrl(BuildContext context, String url) {
    unawaited(share(context, url: url));
  }

  static void shareQrCode(BuildContext context, GlobalKey repaintKey) {
    unawaited(
      share(
        context,
        onShareFiles: () async {
          return GenerateQrCodeController.onShareFiles(repaintKey);
        },
      ),
    );
  }

  static Widget bodyBuilder(BuildContext context, HistoryState state) {
    if (state is HistoryLoading) return const HistoryLoadingWidget();

    if (state is HistoryLoaded) {
      if (state.historyList.isEmpty) return const HistoryEmptyWidget();

      return HistoryLoadedWidget(state: state);
    }

    return const HistoryEmptyWidget();
  }
}
