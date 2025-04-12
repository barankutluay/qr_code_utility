import 'dart:io';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myproject/core/app.dart';
import 'package:myproject/core/configs/app_bloc_observer.dart';
import 'package:myproject/core/styles/custom_system_ui_overlay_style.dart';
import 'package:myproject/core/utils/svg_preloader_util.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

// TODO: Profiler ile performans ölçümü yap ve optimize et
// TODO: Tüm kodları gezerek hata yakalama eksiklerini ekle
// TODO: Basit bir logo tasarla, app ikonları vs o logo yap
// TODO: Logoyla birlikte basit bir splash screen oluştur
// TODO: Widget ve diğer testleri yaz
// TODO: Figma dosyası ile birlikte güzel bir rapor hazırla ve githubda paylaş
// TODO: Tema tercihini shared preferences ile kaydet

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();

  await SvgPreloaderUtil.svgPreloader(SvgPreloaderUtil.svgPreloaderPaths);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  CustomSystemUiOverlayStyle.setStyle(
    PlatformDispatcher.instance.platformBrightness == Brightness.dark,
  );

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  runApp(const App());
}
