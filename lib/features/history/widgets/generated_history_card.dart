import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_strings.dart';
import 'package:myproject/core/utils/border_util.dart';
import 'package:myproject/core/utils/padding_util.dart';
import 'package:myproject/core/utils/share_util.dart';
import 'package:myproject/features/home/controllers/generate_qr_code_controller.dart';
import 'package:myproject/features/home/widgets/custom_qr_image_view.dart';
import 'package:myproject/features/home/widgets/open_in_new_button.dart';
import 'package:myproject/features/home/widgets/share_button.dart';
import 'package:smooth_corner/smooth_corner.dart';

class GeneratedHistoryCard extends StatelessWidget {
  const GeneratedHistoryCard({
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
              Opacity(
                opacity: 0.5,
                child: Text(
                  AppStrings.historyGeneratedCardTitle,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              16.verticalSpacingRadius,
              Text(
                dateString,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
              ),
              24.verticalSpacingRadius,
              CustomQrImageView(data: url, repaintKey: repaintKey),
              32.verticalSpacingRadius,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 16.r,
                children: [
                  ShareButton(
                    url: url,
                    onPressed: () {
                      unawaited(
                        share(
                          context,
                          url: url,
                          onShareFiles: () async {
                            return GenerateQrCodeController.onShareFiles(
                              repaintKey,
                            );
                          },
                        ),
                      );
                    },
                  ),
                  OpenInNewButton(url: url),
                ],
              ),
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
