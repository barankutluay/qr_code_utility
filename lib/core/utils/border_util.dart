import 'package:flutter/material.dart';

class BorderUtil {
  static BorderRadius only({double topLeft = 0, double topRight = 0, double bottomLeft = 0, double bottomRight = 0}) {
    return BorderRadius.only(
      topLeft: Radius.circular(topLeft),
      topRight: Radius.circular(topRight),
      bottomLeft: Radius.circular(bottomLeft),
      bottomRight: Radius.circular(bottomRight),
    );
  }

  static BorderRadius all(double radius) {
    return BorderRadius.all(Radius.circular(radius));
  }
}
