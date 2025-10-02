import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../enum/language_enum.dart';

extension ThemeExtension on BuildContext{
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  TextTheme get textTheme => theme.textTheme;

  Color get primaryColor => colorScheme.primary;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get fullWidth => mediaQuery.size.width;

  double get fullHeight => mediaQuery.size.height;

  /// Calculates the available height for the body content.
  /// It takes into account the device size, status bar height, toolbar height, bottom bar height, and bottom padding.
  double get bodyHeight {
    Size size = mediaQuery.size;
    double statusBar = mediaQuery.viewPadding.top;
    double kLeadingWidth = kToolbarHeight;
    double bottomBar = mediaQuery.viewInsets.bottom;
    double bottomPadding = mediaQuery.viewPadding.bottom;
    double bottomSafeArea = mediaQuery.padding.bottom;
    return size.height - statusBar - kLeadingWidth - bottomBar - bottomPadding - bottomSafeArea;
  }

  get locale => Localizations.localeOf(this);

  get isArabic => locale == Locale(LanguageEnum.ar.name);

  get isEnglish => locale ==  Locale(LanguageEnum.en.name);

  get isDark => theme.brightness == Brightness.dark;

  get isLight => theme.brightness == Brightness.light;
}

extension FontWeightExtension on FontWeight {
  FontWeight get thin => FontWeight.w100;
  FontWeight get extraLight => FontWeight.w200;
  FontWeight get light => FontWeight.w300;
  FontWeight get normal => FontWeight.w400;
  FontWeight get regular => FontWeight.w400;
  FontWeight get medium => FontWeight.w500;
  FontWeight get semiBold => FontWeight.w600;
  FontWeight get bold => FontWeight.w700;
  FontWeight get extraBold => FontWeight.w800;
  FontWeight get black => FontWeight.w900;
}

extension FigmaDimension on num {
  ///use this to get font height to set in text from flutter
  double fromFigmaHeight(double fontSize) {
    return h / fontSize.sp;
  }
}
