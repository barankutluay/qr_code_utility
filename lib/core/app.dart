import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_utility/core/constants/app_strings.dart';
import 'package:qr_code_utility/core/styles/custom_system_ui_overlay_style.dart';
import 'package:qr_code_utility/core/themes/app_theme.dart';
import 'package:qr_code_utility/core/utils/build_when_util.dart';
import 'package:qr_code_utility/core/utils/go_router_util.dart';
import 'package:qr_code_utility/data/cubits/theme_switch/theme_switch_cubit.dart';

final class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      enableScaleText: () => true,
      enableScaleWH: () => true,
      useInheritedMediaQuery: true,
      fontSizeResolver: (fontSize, instance) {
        return fontSize * instance.screenWidth / 375;
      },
      builder: (context, child) {
        return BlocProvider(
          create: (context) => ThemeSwitchCubit(),
          child: BlocBuilder<ThemeSwitchCubit, ThemeSwitchState>(
            buildWhen: buildWhen,
            builder: (context, state) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                CustomSystemUiOverlayStyle.setStyle(state.isDarkMode);
              });

              return MaterialApp.router(
                title: AppStrings.appName,
                routerConfig: GoRouterUtil.router,
                debugShowCheckedModeBanner: false,
                theme:
                    state.isDarkMode
                        ? AppTheme.dark(context)
                        : AppTheme.light(context),
              );
            },
          ),
        );
      },
    );
  }
}
