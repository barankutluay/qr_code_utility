import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myproject/core/utils/logger_util.dart';
import 'package:myproject/data/models/qr_history_model.dart';
import 'package:myproject/data/repos/qr_history_repository.dart';

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

  Future<void> clearHistory() async {
    try {
      await QrHistoryRepository.instance.clearAllHistory();
      emit(const HistoryLoaded(historyList: []));
    } catch (error, stackTrace) {
      LoggerUtil.error("Couldn't clear history: $error", error, stackTrace);
      rethrow;
    }
  }
}
