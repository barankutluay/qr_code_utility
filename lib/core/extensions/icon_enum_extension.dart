import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myproject/core/enums/icon_enum.dart';

extension IconEnumExtension on IconEnum {
  String get _assetName => 'assets/icons/$name.svg';

  Widget toSVGWidget({
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
    Color? color,
    String? semanticsLabel,
  }) {
    return SvgPicture.asset(
      _assetName,
      width: width,
      height: height,
      fit: fit,
      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      semanticsLabel: semanticsLabel,
    );
  }
}
