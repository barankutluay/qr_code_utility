import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClearHistoryDialogVerticalDivider extends StatelessWidget {
  const ClearHistoryDialogVerticalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.r,
      child: VerticalDivider(
        color: Theme.of(context).dividerColor,
        width: 0,
        thickness: 1.r,
        indent: (14.r * 1.2),
        endIndent: (14.r * 1.2),
      ),
    );
  }
}
