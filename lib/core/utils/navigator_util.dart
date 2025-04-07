import 'package:flutter/material.dart';

final class NavigatorUtil {
  const NavigatorUtil._();

  static Future<void> push(BuildContext context, Route route) async =>
      Navigator.of(context).push(route);

  static Future<void> pushNamed(BuildContext context, String routeName) async =>
      Navigator.of(context).pushNamed(routeName);

  static Future<void> pushReplacement(
    BuildContext context,
    Route route,
  ) async => Navigator.of(context).pushReplacement(route);

  static void pop(BuildContext context) => Navigator.of(context).pop();
}
