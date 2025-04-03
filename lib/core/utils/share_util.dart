import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

void share(
  BuildContext context, {
  String? url,
  Future<List<XFile>> Function()? onShareFiles,
}) async {
  final RenderBox? renderBox = context.findRenderObject() as RenderBox?;

  if (renderBox == null) return;

  final sharePositionOrigin =
      renderBox.localToGlobal(Offset.zero) & renderBox.size;

  if (url != null) {
    Share.share(url, sharePositionOrigin: sharePositionOrigin);
  } else if (onShareFiles != null) {
    final files = await onShareFiles();
    if (files.isNotEmpty) {
      Share.shareXFiles(files, sharePositionOrigin: sharePositionOrigin);
    }
  }
}
