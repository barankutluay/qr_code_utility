import 'package:flutter/material.dart';

class NavigatorUtil {
  static void push(BuildContext context, Route route) =>
      Navigator.of(context).push(route);

  static void pushNamed(BuildContext context, String routeName) =>
      Navigator.of(context).pushNamed(routeName);

  static void pushReplacement(BuildContext context, Route route) =>
      Navigator.of(context).pushReplacement(route);

  static void pop(BuildContext context) => Navigator.of(context).pop();
}
