import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_utility/data/cubits/history/history_cubit.dart';
import 'package:qr_code_utility/features/history/screens/history_screen_layout.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HistoryCubit()..pageLoading(),
      child: const Scaffold(body: HistoryScreenLayout()),
    );
  }
}
