import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_utility/core/utils/border_util.dart';
import 'package:qr_code_utility/core/utils/padding_util.dart';
import 'package:qr_code_utility/features/history/widgets/history_scanned_card/history_scanned_card_buttons.dart';
import 'package:qr_code_utility/features/history/widgets/history_scanned_card/history_scanned_card_date_string.dart';
import 'package:qr_code_utility/features/history/widgets/history_scanned_card/history_scanned_card_title.dart';
import 'package:qr_code_utility/features/history/widgets/history_scanned_card/history_scanned_card_url.dart';
import 'package:smooth_corner/smooth_corner.dart';

class HistoryScannedCard extends StatelessWidget {
  const HistoryScannedCard({
    required this.dateString,
    required this.url,
    super.key,
  });

  final String dateString;
  final String url;

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
              const HistoryScannedCardTitle(),
              16.verticalSpacingRadius,
              HistoryScannedCardDateString(dateString: dateString),
              24.verticalSpacingRadius,
              HistoryScannedCardUrl(url: url),
              32.verticalSpacingRadius,
              HistoryScannedCardButtons(url: url),
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
      ..add(StringProperty('url', url));
  }
}
