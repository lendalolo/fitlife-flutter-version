import 'package:fitness/features/clubs/common/themes/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


part 'general_theme.dart';

class AppTheme {
  AppTheme.init({
    required this.darkColorScheme,
    required this.lightColorScheme,
  });

  final ColorScheme darkColorScheme;
  final ColorScheme lightColorScheme;

  ///Appbar
  AppBarTheme appBarTheme(ColorScheme scheme) => AppBarTheme(
    backgroundColor: scheme.primary,
    toolbarHeight: 48,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarDividerColor: scheme.surface,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: scheme.surface,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ),
    elevation: 0,
    foregroundColor: scheme.onPrimary,
    centerTitle: true,
    iconTheme: IconThemeData(size: 24.r, color: scheme.onPrimary),
  );

  ///CheckBox
  CheckboxThemeData checkboxThemeData({required bool isDark}) =>
      const CheckboxThemeData();

  /// Icon
  IconThemeData iconTheme(ColorScheme scheme) =>
      IconThemeData(size: 20.r, color: scheme.primary);

  ///Chip
  ChipThemeData chipTheme(ColorScheme scheme) => ChipThemeData(
    padding: REdgeInsets.only(top: 6, left: 24, right: 24),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
    side: BorderSide.none,
    showCheckmark: false,
    selectedColor: scheme.primary,
    labelStyle: getTextTheme.titleMedium,
    color: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return scheme.secondary;
      }
      return scheme.onSecondary;
    }),
  );

  ///FloatingActionButtonThemeData
  FloatingActionButtonThemeData floatingActionButtonTheme({
    required bool isDark,
  }) => const FloatingActionButtonThemeData();

  ///TabBarTheme
  TabBarThemeData tabBarTheme(ColorScheme scheme) => TabBarThemeData(
    labelColor: scheme.secondary,
    unselectedLabelColor: scheme.onSecondary,
  );

  ///bottomSheetTheme
  bottomSheetTheme({required bool isDark}) => const BottomSheetThemeData();

  ///cardTheme
  CardThemeData cardTheme(ColorScheme scheme) =>
      CardThemeData(color: scheme.surface, elevation: 0);

  ///dialogTheme
  DialogThemeData dialogTheme({required bool isDark}) => const DialogThemeData();

  ///listTileTheme
  ListTileThemeData listTileTheme({required bool isDark}) =>
      const ListTileThemeData();

  DividerThemeData dividerTheme(ColorScheme scheme) => DividerThemeData(
    color: scheme.outline,
    endIndent: 0,
    indent: 0,
    thickness: 1.r,
    space: 20.r,
  );

  ///navigationBarTheme
  NavigationBarThemeData navigationBarTheme({required bool isDark}) =>
      const NavigationBarThemeData();

  BottomNavigationBarThemeData bottomNavigationBarTheme(
    ColorScheme scheme,
  ) => BottomNavigationBarThemeData(
    // backgroundColor:
    //     isDark ? darkColorScheme.background : lightColorScheme.background,
    selectedItemColor: scheme.primary,
    unselectedItemColor: scheme.secondary,

    selectedLabelStyle: getTextTheme.bodyMedium?.copyWith(
      color: scheme.primary,
    ),
    unselectedIconTheme: IconThemeData(size: 25, color: scheme.secondary),
    selectedIconTheme: IconThemeData(size: 25, color: scheme.primary),
    showSelectedLabels: true,
    showUnselectedLabels: false,
    elevation: 0,
    backgroundColor: scheme.surface,
  );

  InputDecorationTheme inputDecoration({required bool isDark}) {
    const inputBorderRadius = BorderRadius.all(Radius.circular(12.0));
    return const InputDecorationTheme(
      contentPadding: EdgeInsets.all(16),
      constraints: BoxConstraints(maxHeight: 56, minHeight: 56),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1),
        borderRadius: inputBorderRadius,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(width: 1),
        borderRadius: inputBorderRadius,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2),
        borderRadius: inputBorderRadius,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1),
        borderRadius: inputBorderRadius,
      ),
    );
  }
}
