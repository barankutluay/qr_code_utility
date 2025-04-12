import 'package:flutter/material.dart';

final class NavigatorUtil {
  const NavigatorUtil._();

  static Future<void> push(BuildContext context, Route<dynamic> route) async {
    await Navigator.of(context).push(route);
  }

  static Future<void> pushNamed(BuildContext context, String routeName) async {
    await Navigator.of(context).pushNamed(routeName);
  }

  static Future<void> pushReplacement(
    BuildContext context,
    Route<dynamic> route,
  ) async {
    await Navigator.of(context).pushReplacement(route);
  }

  static void pop(BuildContext context) => Navigator.of(context).pop();
}
