import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_utility/core/utils/build_when_util.dart';
import 'package:qr_code_utility/data/cubits/history/history_cubit.dart';
import 'package:qr_code_utility/features/history/controllers/history_controller.dart';
import 'package:qr_code_utility/features/history/widgets/history_app_bar.dart';

class HistoryScreenLayout extends StatelessWidget {
  const HistoryScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final historyCubit = HistoryController.read(context);
    unawaited(historyCubit.getHistory());

    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [HistoryAppBar(innerBoxIsScrolled: innerBoxIsScrolled)];
        },
        body: const BlocBuilder<HistoryCubit, HistoryState>(
          buildWhen: buildWhen,
          builder: HistoryController.bodyBuilder,
        ),
      ),
    );
  }
}
