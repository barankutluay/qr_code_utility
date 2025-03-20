import 'package:flutter/material.dart';

class NavigatorUtil {
  static void push(BuildContext context, {required Widget nextPage}) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => nextPage));
  }

  static void pushReplacement(BuildContext context, {required Widget nextPage}) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => nextPage));
  }

  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }
}
