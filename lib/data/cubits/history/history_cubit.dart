import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:myproject/core/utils/dialog_util.dart';
import 'package:myproject/core/utils/logger_util.dart';
import 'package:myproject/data/models/qr_history_model.dart';
import 'package:myproject/data/repos/qr_history_repository.dart';
import 'package:myproject/features/history/widgets/clear_history_dialog/clear_history_dialog.dart';

part 'history_state.dart';

final class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(const HistoryInitial());

  void pageLoading() => emit(const HistoryLoading());

  Future<void> getHistory() async {
    try {
      final historyList = await QrHistoryRepository.instance.getAllHistory();
      emit(HistoryLoaded(historyList: historyList));
    } catch (error, stackTrace) {
      LoggerUtil.error('Get history error: $error', error, stackTrace);
      rethrow;
    }
  }

  Future<void> clearHistory(BuildContext context) async {
    try {
      final result = await showCustomDialog(
        context,
        widget: const ClearHistoryDialog(),
      );
      if (result != null && result) {
        await QrHistoryRepository.instance.clearAllHistory();
        emit(const HistoryLoaded(historyList: []));
      } else {
        return;
      }
    } catch (error, stackTrace) {
      LoggerUtil.error("Couldn't clear history: $error", error, stackTrace);
      rethrow;
    }
  }
}
