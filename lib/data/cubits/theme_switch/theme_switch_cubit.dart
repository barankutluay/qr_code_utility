import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myproject/core/styles/custom_system_ui_overlay_style.dart';
import 'package:myproject/core/utils/logger_util.dart';

part 'theme_switch_state.dart';

final class ThemeSwitchCubit extends Cubit<ThemeSwitchState> {
  ThemeSwitchCubit()
    : super(
        ThemeSwitchState(
          isDarkMode:
              PlatformDispatcher.instance.platformBrightness == Brightness.dark,
        ),
      );

  void toggleTheme() {
    LoggerUtil.info(
      "Theme toggled ${state.isDarkMode ? "'Light Mode'" : "'Dark Mode'"}",
    );
    CustomSystemUiOverlayStyle.setStyle(state.isDarkMode);
    emit(ThemeSwitchState(isDarkMode: !state.isDarkMode));
  }
}
