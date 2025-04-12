import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

Future<void> share(
  BuildContext context, {
  String? url,
  Future<List<XFile>> Function()? onShareFiles,
}) async {
  final renderBox = context.findRenderObject() as RenderBox?;

  if (renderBox == null) return;

  final sharePositionOrigin =
      renderBox.localToGlobal(Offset.zero) & renderBox.size;

  if (url != null) {
    await Share.share(url, sharePositionOrigin: sharePositionOrigin);
  } else if (onShareFiles != null) {
    final files = await onShareFiles();

    if (files.isNotEmpty) {
      await Share.shareXFiles(files, sharePositionOrigin: sharePositionOrigin);
    }
  }
}
