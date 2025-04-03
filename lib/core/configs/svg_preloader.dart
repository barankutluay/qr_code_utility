import 'package:flutter_svg/flutter_svg.dart';
import 'package:myproject/core/utils/logger_util.dart';

Future<void> preloadSvgAssets(List<String> assetPaths) async {
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

const List<String> preloadingAssetPathList = [
  'assets/icons/scanIcon.svg',
  'assets/icons/history.svg',
  'assets/icons/create.svg',
];
