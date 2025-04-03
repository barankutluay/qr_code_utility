import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myproject/core/app.dart';
import 'package:myproject/core/configs/bloc_observer.dart';
import 'package:myproject/core/configs/svg_preloader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = const AppBlocObserver();

  await preloadSvgAssets(preloadingAssetPathList);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const App());
}
