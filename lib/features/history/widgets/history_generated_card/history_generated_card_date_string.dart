import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HistoryGeneratedCardDateString extends StatelessWidget {
  const HistoryGeneratedCardDateString({required this.dateString, super.key});

  final String dateString;

  @override
  Widget build(BuildContext context) {
    return Text(
      dateString,
      style: Theme.of(
        context,
      ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('dateString', dateString));
  }
}
