import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:myproject/core/constants/app_durations.dart';
import 'package:myproject/core/utils/bottom_sheet_util.dart';
import 'package:myproject/core/utils/logger_util.dart';
import 'package:myproject/data/cubits/text_form_field/text_form_field_cubit.dart';
import 'package:myproject/data/cubits/theme_switch/theme_switch_cubit.dart';
import 'package:myproject/features/home/controllers/link_text_field_controller.dart';
import 'package:myproject/features/home/widgets/custom_qr_image_view.dart';
import 'package:myproject/features/home/widgets/generated_code_bottom_sheet.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class GenerateQrCodeController {
  static void generateQrCodeAndNavigate(
    BuildContext context,
    TextFormFieldCubit textFormFieldCubit,
    ThemeSwitchCubit themeSwitchCubit,
    GlobalKey repaintKey,
  ) {
    final String url = textFormFieldCubit.state.value;

    final Widget qrImageView = CustomQrImageView(
      data: textFormFieldCubit.state.value,
      themeSwitchCubit: themeSwitchCubit,
      repaintKey: repaintKey,
    );

    final bool isValidated = LinkTextFieldController.validateLink(context, url);

    if (context.canPop() && isValidated) {
      context.pop();
      Future.delayed(AppDurations.duration300ms, () {
        if (!context.mounted) {
          return;
        } else {
          showCustomModalBottomSheet(
            context,
            widget: GeneratedCodeBottomSheet(qrImageView, repaintKey, url),
          );
        }
      });
    } else {
      return;
    }
  }

  static Future<List<XFile>> captureImage(GlobalKey repaintKey) async {
    try {
      final renderObject = repaintKey.currentContext?.findRenderObject();

      if (renderObject == null || (renderObject is! RenderRepaintBoundary)) {
        LoggerUtil.error("RenderRepaintBoundary not found!");
        return [];
      }

      final boundary = renderObject;

      await Future.delayed(AppDurations.duration100ms);

      final ui.Image image = await boundary.toImage(pixelRatio: 5.0);

      final ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      if (byteData == null) {
        LoggerUtil.error("ByteData is null!");
        return [];
      }

      final Uint8List pngBytes = byteData.buffer.asUint8List();
      final Directory tempDir = await getTemporaryDirectory();
      final String filePath =
          '${tempDir.path}/qr_${DateTime.now().millisecondsSinceEpoch}.png';
      final File file = File(filePath);
      await file.writeAsBytes(pngBytes);

      final decodedImage = await decodeImageFromList(pngBytes);
      LoggerUtil.debug(
        "QR Boyutları: ${decodedImage.width}x${decodedImage.height}",
      );

      return [XFile(file.path)];
    } catch (e) {
      LoggerUtil.error(e);
      return [];
    }
  }
}
