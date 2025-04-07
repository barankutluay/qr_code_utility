import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/data/cubits/theme_switch/theme_switch_cubit.dart';

final class ThemeSwitchController {
  const ThemeSwitchController._();

  static void Function(BuildContext context) toggleTheme =
      (BuildContext context) => context.read<ThemeSwitchCubit>().toggleTheme();

  static ThemeSwitchCubit Function(BuildContext context) read =
      (BuildContext context) => context.read<ThemeSwitchCubit>();

  static ThemeSwitchCubit Function(BuildContext context) watch =
      (BuildContext context) => context.watch<ThemeSwitchCubit>();
}
