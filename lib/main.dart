import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myproject/core/app.dart';
import 'package:myproject/core/configs/bloc_observer.dart';

void main() async {
  Bloc.observer = const AppBlocObserver();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const App());
}
