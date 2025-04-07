part of 'theme_switch_cubit.dart';

final class ThemeSwitchState extends Equatable {
  const ThemeSwitchState({required this.isDarkMode});
  final bool isDarkMode;

  @override
  List<Object> get props => [isDarkMode];
}
