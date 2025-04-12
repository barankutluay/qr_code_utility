import 'package:flutter_svg/flutter_svg.dart';
import 'package:myproject/core/utils/logger_util.dart';

final class SvgPreloaderUtil {
  const SvgPreloaderUtil._();

  static const List<String> svgPreloaderPaths = [
    'assets/icons/scanIcon.svg',
    'assets/icons/history.svg',
    'assets/icons/create.svg',
    'assets/icons/chevronBackward.svg',
    'assets/icons/delete.svg',
    'assets/icons/share.svg',
    'assets/icons/openInNew.svg',
  ];

  static Future<void> svgPreloader(List<String> assetPaths) async {
    for (final path in assetPaths) {
      final loader = SvgAssetLoader(path);
      LoggerUtil.info('Preloading SVG: $path');
      await svg.cache.putIfAbsent(
        loader.cacheKey(null),
        () => loader.loadBytes(null),
      );
      LoggerUtil.info('Preloaded SVG: $path');
    }
  }
}
