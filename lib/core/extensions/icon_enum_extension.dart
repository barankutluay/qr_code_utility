import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myproject/core/enums/icon_enum.dart';

extension IconEnumExtension on IconEnum {
  String get _assetName => 'assets/icons/$name.svg';

  Widget toSVGWidget(
    BuildContext context, {
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
    Color? color,
    String? semanticsLabel,
  }) {
    final iconColor = color ?? Theme.of(context).iconTheme.color;

    return SvgPicture.asset(
      _assetName,
      width: width,
      height: height,
      fit: fit,
      colorFilter:
          iconColor != null
              ? ColorFilter.mode(iconColor, BlendMode.srcIn)
              : null,
      semanticsLabel: semanticsLabel,
    );
  }
}
