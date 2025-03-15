import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myproject/core/utils/logger_util.dart';

part 'theme_switch_state.dart';

class ThemeSwitchCubit extends Cubit<ThemeSwitchState> {
  ThemeSwitchCubit()
    : super(ThemeSwitchState(isDarkMode: PlatformDispatcher.instance.platformBrightness == Brightness.dark));

  void toggleTheme() {
    LoggerUtil.debug("Theme toggled ${state.isDarkMode ? "'Light Mode'" : "'Dark Mode'"}");
    emit(ThemeSwitchState(isDarkMode: !state.isDarkMode));
  }
}
