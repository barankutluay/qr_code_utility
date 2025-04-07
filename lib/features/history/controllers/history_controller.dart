import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/data/cubits/history/history_cubit.dart';

final class HistoryController {
  HistoryController._();
  static final HistoryController instance = HistoryController._();

  static HistoryCubit Function(BuildContext context) read =
      (context) => context.read<HistoryCubit>();
  static HistoryCubit Function(BuildContext context) watch =
      (context) => context.watch<HistoryCubit>();
}
