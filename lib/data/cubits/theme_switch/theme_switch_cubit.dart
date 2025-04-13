import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qr_code_utility/core/styles/custom_system_ui_overlay_style.dart';
import 'package:qr_code_utility/core/utils/logger_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_switch_state.dart';

final class ThemeSwitchCubit extends Cubit<ThemeSwitchState> {
  ThemeSwitchCubit()
    : super(
        ThemeSwitchState(
          isDarkMode:
              PlatformDispatcher.instance.platformBrightness == Brightness.dark,
        ),
      ) {
    unawaited(_loadTheme());
  }

  static const String _themeKey = 'isDarkMode';

  Future<void> _loadTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedTheme = prefs.getBool(_themeKey);
      final systemIsDarkMode =
          PlatformDispatcher.instance.platformBrightness == Brightness.dark;
      final isDarkMode = savedTheme ?? systemIsDarkMode;

      emit(ThemeSwitchState(isDarkMode: isDarkMode));

      PlatformDispatcher.instance.onPlatformBrightnessChanged = () {
        final currentIsDark =
            PlatformDispatcher.instance.platformBrightness == Brightness.dark;
        CustomSystemUiOverlayStyle.setStyle(currentIsDark);
      };

      CustomSystemUiOverlayStyle.setStyle(isDarkMode);
    } catch (error, stackTrace) {
      LoggerUtil.error('Theme could not be loaded: $error', error, stackTrace);
      rethrow;
    }
  }

  Future<void> toggleTheme() async {
    try {
      final newIsDarkMode = !state.isDarkMode;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_themeKey, newIsDarkMode);

      LoggerUtil.info(
        "Theme toggled ${state.isDarkMode ? "'Light Mode'" : "'Dark Mode'"}",
      );

      CustomSystemUiOverlayStyle.setStyle(state.isDarkMode);
      emit(ThemeSwitchState(isDarkMode: !state.isDarkMode));
    } catch (error, stackTrace) {
      LoggerUtil.error('Error: $error', error, stackTrace);
      rethrow;
    }
  }
}
