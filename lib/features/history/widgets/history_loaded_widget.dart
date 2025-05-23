import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_utility/core/utils/padding_util.dart';
import 'package:qr_code_utility/data/cubits/history/history_cubit.dart';
import 'package:qr_code_utility/features/history/widgets/history_generated_card/history_generated_card_layout.dart';
import 'package:qr_code_utility/features/history/widgets/history_scanned_card/history_scanned_card_layout.dart';

class HistoryLoadedWidget extends StatelessWidget {
  const HistoryLoadedWidget({required this.state, super.key});

  final HistoryLoaded state;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: PaddingUtil.horizontalAndVertical(20.r, 24.r),
      itemCount: state.historyList.length,
      itemBuilder: (context, index) {
        final item = state.historyList[index];
        final repaintKey = item.type == 0 ? GlobalKey() : null;

        return switch (item.type) {
          0 => HistoryGeneratedCardLayout(
            dateString: item.formattedTime,
            url: item.url,
            repaintKey: repaintKey!,
          ),
          1 => HistoryScannedCardLayout(
            dateString: item.formattedTime,
            url: item.url,
          ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<HistoryLoaded>('state', state));
  }
}
