import 'package:fitness/features/clubs/service/navigation/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/themes/app_theme.dart';
import 'common/themes/theme_dark.dart';
import 'common/themes/theme_light.dart';
import 'global_widgets/dismiss_keyboard_gesture_detector_wrapper.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(402, 715),
      minTextAdapt: false,
      splitScreenMode: true,
      child: Builder(
        builder: (context) {
          final theme = AppTheme.init(
            darkColorScheme: darkColorScheme,
            lightColorScheme: lightColorScheme,
          );

          return DismissKeyboardGestureDetectorWrapper(
            child: SizedBox(
              height: MediaQuery.of(context).size.height*.8 ,
              child: MaterialApp.router(
                routerConfig: router,
                // locale: Locale("en"),
                title: "Demo App",
                debugShowCheckedModeBanner: false,
                theme: theme.lightTheme,
                darkTheme: theme.darkTheme,
                themeMode: ThemeMode.dark,
                //endregion
              ),
            ),
          );
        },
      ),
    );
  }
}
