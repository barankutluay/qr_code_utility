part of 'history_cubit.dart';

sealed class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object> get props => [];
}

final class HistoryInitial extends HistoryState {
  const HistoryInitial();

  @override
  List<Object> get props => [];
}

final class HistoryLoading extends HistoryState {
  const HistoryLoading();

  @override
  List<Object> get props => [];
}

final class HistoryLoaded extends HistoryState {
  const HistoryLoaded({required this.historyList});
  final List<QrHistoryModel> historyList;

  @override
  List<Object> get props => [historyList];
}
