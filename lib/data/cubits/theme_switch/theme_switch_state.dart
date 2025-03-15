part of 'theme_switch_cubit.dart';

class ThemeSwitchState extends Equatable {
  final bool isDarkMode;

  const ThemeSwitchState({required this.isDarkMode});

  @override
  List<Object> get props => [isDarkMode];
}
