import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

final class HistoryButtonController {
  const HistoryButtonController._();

  static void handleOnPressed(BuildContext context) {
    unawaited(context.pushNamed('history'));
  }
}
