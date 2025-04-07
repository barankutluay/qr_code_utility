import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:myproject/core/constants/app_durations.dart';
import 'package:myproject/core/utils/bottom_sheet_util.dart';
import 'package:myproject/core/utils/logger_util.dart';
import 'package:myproject/core/utils/save_data_util.dart';
import 'package:myproject/data/cubits/text_form_field/text_form_field_cubit.dart';
import 'package:myproject/data/cubits/theme_switch/theme_switch_cubit.dart';
import 'package:myproject/features/home/controllers/link_text_field_controller.dart';
import 'package:myproject/features/home/widgets/custom_qr_image_view.dart';
import 'package:myproject/features/home/widgets/generated_code_bottom_sheet.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

final class GenerateQrCodeController {
  const GenerateQrCodeController._();

  static Future<void> generateQrCodeAndNavigate(
    BuildContext context,
    TextFormFieldCubit textFormFieldCubit,
    ThemeSwitchCubit themeSwitchCubit,
    GlobalKey repaintKey,
  ) async {
    try {
      final url = textFormFieldCubit.state.value;
      if (!LinkTextFieldController.validateLink(context, url)) return;

      final Widget qrImageView = CustomQrImageView(
        data: textFormFieldCubit.state.value,
        themeSwitchCubit: themeSwitchCubit,
        repaintKey: repaintKey,
      );

      if (context.mounted && context.canPop()) {
        context.pop();

        await Future.delayed(AppDurations.duration300ms, () async {
          await saveData(url: url, time: DateTime.now(), type: 0);

          if (!context.mounted) return;
          await showCustomModalBottomSheet(
            context,
            widget: GeneratedCodeBottomSheet(qrImageView, repaintKey, url),
          );
        });
      }
    } catch (e) {
      LoggerUtil.error('QR Generate Error: $e');
      throw Exception('QR Generate Error: $e');
    }
  }

  static Future<List<XFile>> captureImage(GlobalKey repaintKey) async {
    try {
      final renderObject = repaintKey.currentContext?.findRenderObject();

      if (renderObject == null || (renderObject is! RenderRepaintBoundary)) {
        const e = 'RenderRepaintBoundary not found!';
        throw Exception(e);
      }

      final boundary = renderObject;

      await Future.delayed(AppDurations.duration100ms);

      final image = await boundary.toImage(pixelRatio: 5);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

      if (byteData == null) {
        const e = 'ByteData is null!';
        throw Exception(e);
      }

      final pngBytes = byteData.buffer.asUint8List();
      final tempDir = await getTemporaryDirectory();
      final filePath =
          '${tempDir.path}/qr_${DateTime.now().millisecondsSinceEpoch}.png';
      final file = File(filePath);

      await file.writeAsBytes(pngBytes);

      final decodedImage = await decodeImageFromList(pngBytes);

      LoggerUtil.info(
        'QR Boyutları: ${decodedImage.width}x${decodedImage.height}',
      );

      return [XFile(file.path)];
    } catch (e) {
      LoggerUtil.error(e);
      return [];
    }
  }
}
