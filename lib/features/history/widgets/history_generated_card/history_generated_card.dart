import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/utils/border_util.dart';
import 'package:myproject/core/utils/padding_util.dart';
import 'package:myproject/features/history/widgets/history_generated_card/history_generated_card_buttons.dart';
import 'package:myproject/features/history/widgets/history_generated_card/history_generated_card_date_string.dart';
import 'package:myproject/features/history/widgets/history_generated_card/history_generated_card_qr_image_view.dart';
import 'package:myproject/features/history/widgets/history_generated_card/history_generated_card_title.dart';
import 'package:smooth_corner/smooth_corner.dart';

class HistoryGeneratedCard extends StatelessWidget {
  const HistoryGeneratedCard({
    required this.dateString,
    required this.url,
    required this.repaintKey,
    super.key,
  });

  final String dateString;
  final String url;
  final GlobalKey repaintKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingUtil.onlyBottom(24.r),
      child: SmoothCard(
        elevation: 2,
        semanticContainer: false,
        borderRadius: BorderUtil.all(16.r),
        shadowColor: Theme.of(context).shadowColor,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
          padding: PaddingUtil.horizontalAndVertical(20.r, 24.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const HistoryGeneratedCardTitle(),
              16.verticalSpacingRadius,
              HistoryGeneratedCardDateString(dateString: dateString),
              24.verticalSpacingRadius,
              HistoryGeneratedCardQrImageView(url: url, repaintKey: repaintKey),
              32.verticalSpacingRadius,
              HistoryGeneratedCardButtons(repaintKey: repaintKey, url: url),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('dateString', dateString))
      ..add(StringProperty('url', url))
      ..add(
        DiagnosticsProperty<GlobalKey<State<StatefulWidget>>>(
          'repaintKey',
          repaintKey,
        ),
      );
  }
}
