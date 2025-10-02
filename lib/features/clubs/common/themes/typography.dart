import 'package:fitness/features/clubs/common/extension/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../enum/font_enum.dart';

TextTheme get getTextTheme{
  return TextTheme(
    ///region Font display
    displayLarge: TextStyle(
      fontFamily: getFountByLanguage(),
      fontSize: 72.0.sp,
      fontWeight: FontWeight.normal.regular,
      letterSpacing: -2.25.w,
    ),
    displayMedium: TextStyle(
      fontFamily: getFountByLanguage(),
      fontSize: 64.0.sp,
      fontWeight: FontWeight.normal.regular,
      letterSpacing: -2.25.w,
    ),
    displaySmall: TextStyle(
      fontFamily: getFountByLanguage(),
      fontSize: 56.0.sp,
      fontWeight: FontWeight.normal.regular,
      letterSpacing: -2.25.w,
    ),
    //endregion

    ///region Font headline
    headlineLarge: TextStyle(
      fontFamily: getFountByLanguage(),
      fontSize: 48.0.sp,
      fontWeight: FontWeight.normal.light,
      letterSpacing: 0.w,
    ),
    headlineMedium: TextStyle(
      fontFamily: getFountByLanguage(),
      fontSize: 40.0.sp,
      fontWeight: FontWeight.normal.light,
      letterSpacing: 0.w,
    ),
    headlineSmall: TextStyle(
      fontFamily: getFountByLanguage(),
      fontSize: 32.0.sp,
      fontWeight: FontWeight.normal.light,
      letterSpacing: 0.w,
    ),
    //endregion

    ///region Font title
    titleLarge: TextStyle(
      fontFamily: getFountByLanguage(),
      fontSize: 24.0.sp,
      fontWeight: FontWeight.normal.medium,
      letterSpacing: 0.w,
    ),
    titleMedium: TextStyle(
      fontFamily: getFountByLanguage(),
      fontSize: 18.0.sp,
      fontWeight: FontWeight.normal.medium,
      letterSpacing: 0.w,
    ),
    titleSmall: TextStyle(
      fontFamily: getFountByLanguage(),
      fontSize: 16.0.sp,
      fontWeight: FontWeight.normal.medium,
      letterSpacing: 0.w,
    ),
    //endregion

    ///Body
    bodyLarge: TextStyle(
      fontFamily: getFountByLanguage(),
      fontSize: 24.0.sp,
      fontWeight: FontWeight.normal.regular,
      letterSpacing: 0.w,
    ),
    bodyMedium: TextStyle(
      fontFamily: getFountByLanguage(),
      fontSize: 20.0.sp,
      fontWeight: FontWeight.normal.regular,
      letterSpacing: 0.w,
    ),
    bodySmall: TextStyle(
      fontFamily: getFountByLanguage(),
      fontSize: 16.0.sp,
      fontWeight: FontWeight.normal.regular,
      letterSpacing: 0.w,
    ),
    //endregion

    ///region Font label
    labelLarge: TextStyle(
      fontFamily: getFountByLanguage(),
      fontSize: 14.0.sp,
      fontWeight: FontWeight.normal.light,
      letterSpacing: 3.w,
    ),
    labelMedium: TextStyle(
      fontFamily: getFountByLanguage(),
      fontSize: 12.0.sp,
      fontWeight: FontWeight.normal.light,
      letterSpacing: 1.5.w,
    ),
    labelSmall: TextStyle(
      fontFamily: getFountByLanguage(),
      fontSize: 9.0.sp,
      fontWeight: FontWeight.normal.light,
      letterSpacing: 3.w,
    ),
    //endregion

  );
}

extension TextThemeExtension on TextTheme {
  //region Button
  TextStyle? get buttonLarge => TextStyle(
    fontFamily: getFountByLanguage(),
    fontSize: 16.0.sp,
    fontWeight: FontWeight.normal.medium,
    letterSpacing: 0.w,
  );

  TextStyle? get buttonSmall => TextStyle(
    fontFamily: getFountByLanguage(),
    fontSize: 14.0.sp,
    fontWeight: FontWeight.normal.medium,
    letterSpacing: 0.w,
  );

  TextStyle? get bodyXSmall => TextStyle(
    fontFamily: getFountByLanguage(),
    fontSize: 14.0.sp,
    fontWeight: FontWeight.normal.regular,
    letterSpacing: 0.w,
  );
//endregion
}

String getFountByLanguage({bool isSecondary = false}) {
  if(isSecondary){
    return FontEnum.familyLora.name;
  }
  else{
    return FontEnum.familyCabinet.name;
  }
}