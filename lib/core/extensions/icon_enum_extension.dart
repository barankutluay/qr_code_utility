import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myproject/core/enums/icon_enum.dart';

extension IconEnumExtension on IconEnum {
  String get _getAssetName => 'assets/icons/$name.svg';

  Widget toSVGWidget({
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
    Color? color,
    String? semanticsLabel,
  }) => SvgPicture.asset(
    _getAssetName,
    width: width,
    height: height,
    fit: fit,
    colorFilter:
        color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
    semanticsLabel: semanticsLabel,
  );
}
