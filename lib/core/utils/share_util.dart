import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

void share(
  BuildContext context, {
  String? url,
  Future<List<XFile>> Function()? onShareFiles,
}) async {
  final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
  if (renderBox == null) return;
  if (url != null) {
    Share.share(
      url,
      sharePositionOrigin:
          renderBox.localToGlobal(Offset.zero) & renderBox.size,
    );
  } else if (onShareFiles != null) {
    final files = await onShareFiles();
    if (files.isNotEmpty) {
      Share.shareXFiles(
        files,
        sharePositionOrigin:
            renderBox.localToGlobal(Offset.zero) & renderBox.size,
      );
    }
  }
}
