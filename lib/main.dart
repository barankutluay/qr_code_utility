import 'dart:io';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_utility/core/app.dart';
import 'package:qr_code_utility/core/configs/app_bloc_observer.dart';
import 'package:qr_code_utility/core/styles/custom_system_ui_overlay_style.dart';
import 'package:qr_code_utility/core/utils/svg_preloader_util.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

// TODO: Basit bir logo tasarla, app ikonları vs o logo yap
// TODO: Logoyla birlikte basit bir splash screen oluştur
// TODO: Figma dosyası ile birlikte güzel bir rapor hazırla ve github da paylaş

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();

  final initialBrightness =
      PlatformDispatcher.instance.platformBrightness == Brightness.dark;

  CustomSystemUiOverlayStyle.setStyle(initialBrightness);

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  await SvgPreloaderUtil.svgPreloader(SvgPreloaderUtil.svgPreloaderPaths);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  runApp(const App());
}
