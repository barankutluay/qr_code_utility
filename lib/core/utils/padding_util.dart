import 'package:flutter/material.dart';

class PaddingUtil {
  static EdgeInsets all(double value) {
    return EdgeInsets.all(value);
  }

  static EdgeInsets only(double top, double right, double bottom, double left) {
    return EdgeInsets.only(top: top, right: right, bottom: bottom, left: left);
  }

  static EdgeInsets zero() {
    return EdgeInsets.zero;
  }

  static EdgeInsets onlyTop(double value) {
    return EdgeInsets.only(top: value);
  }

  static EdgeInsets onlyBottom(double value) {
    return EdgeInsets.only(bottom: value);
  }

  static EdgeInsets onlyLeft(double value) {
    return EdgeInsets.only(left: value);
  }

  static EdgeInsets onlyRight(double value) {
    return EdgeInsets.only(right: value);
  }

  static EdgeInsets horizontal(double value) {
    return EdgeInsets.symmetric(horizontal: value);
  }

  static EdgeInsets vertical(double value) {
    return EdgeInsets.symmetric(vertical: value);
  }

  static EdgeInsets horizontalAndVertical(double horizontal, double vertical) {
    return EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
  }

  static EdgeInsets topAndRight(double top, double right) {
    return EdgeInsets.only(top: top, right: right);
  }

  static EdgeInsets topAndLeft(double top, double left) {
    return EdgeInsets.only(top: top, left: left);
  }

  static EdgeInsets bottomAndRight(double bottom, double right) {
    return EdgeInsets.only(bottom: bottom, right: right);
  }

  static EdgeInsets bottomAndLeft(double bottom, double left) {
    return EdgeInsets.only(bottom: bottom, left: left);
  }
}
