import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myproject/core/app.dart';
import 'package:myproject/core/configs/app_bloc_observer.dart';
import 'package:myproject/core/utils/svg_preloader_util.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = const AppBlocObserver();

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
