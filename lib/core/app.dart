import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproject/core/constants/app_strings.dart';
import 'package:myproject/core/themes/app_theme.dart';
import 'package:myproject/data/cubits/theme_switch/theme_switch_cubit.dart';
import 'package:myproject/features/home/screens/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => ThemeSwitchCubit(),
          child: BlocBuilder<ThemeSwitchCubit, ThemeSwitchState>(
            builder: (context, state) {
              return MaterialApp(
                title: AppStrings.appName,
                debugShowCheckedModeBanner: false,
                theme: state.isDarkMode ? AppTheme.darkTheme(context) : AppTheme.lightTheme(context),
                home: HomeScreen(),
              );
            },
          ),
        );
      },
    );
  }
}
