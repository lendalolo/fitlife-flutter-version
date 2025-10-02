import 'package:fitness/features/clubs/common/extension/color_extension.dart';
import 'package:fitness/features/clubs/common/themes/reference_color.dart';
import 'package:flutter/material.dart';


extension ColorSchemeExtension on ColorScheme {
  //region Green
  Color get green => getColor(light: const Color(0xFF35B550), dark: const Color(0xFF35B550));
  Color get onGreen => getColor(light: const Color(0xFF093412), dark: const Color(0xFF093412));
  Color get greenContainer => getColor(light: const Color(0xFFE9F7EC), dark: const Color(0xFF093412));
  Color get onGreenContainer => getColor(light: const Color(0xFF093412), dark: const Color(0xFFE9F7EC));
  //endregion

  //region orange
  Color get orange => getColor(light: const Color(0xFFFEB261), dark: const Color(0xFFFEB261));
  Color get onOrange => getColor(light: const Color(0xFF4C3318), dark: const Color(0xFF4C3318));
  Color get orangeContainer => getColor(light: const Color(0xFFFFF2E5), dark: const Color(0xFF4C3318));
  Color get onOrangeContainer => getColor(light: const Color(0xFF4C3318), dark: const Color(0xFFFFFBF6));
  //endregion

  //region Blue
  Color get blue => getColor(light: const Color(0xFF5F7DE8), dark: const Color(0xFF5F7DE8));
  Color get onBlue => getColor(light: const Color(0xFFF6F8FE), dark: const Color(0xFFF6F8FE));
  Color get blueContainer => getColor(light: const Color(0xFFEDF0FC), dark: const Color(0xFF172145));
  Color get onBlueContainer => getColor(light: const Color(0xFF172145), dark: const Color(0xFFEDF0FC));
  //endregion

  //region Emphases
  Color get mediumEmphases => getColor(light: ReferenceColor.n.shade40, dark: ReferenceColor.n.shade90);
  Color get lowEmphases => getColor(light: ReferenceColor.n.shade50, dark: ReferenceColor.n.shade80);
  Color get lowestEmphases => getColor(light: ReferenceColor.n.shade70, dark: ReferenceColor.n.shade45);
  //endregion


  //region Color Button
  //Filled
  Color get primaryFilledBgHover => getColor(light: ReferenceColor.p.shade40, dark: ReferenceColor.p.shade40);
  Color get primaryFilledBgOnPress => getColor(light: ReferenceColor.p.shade30, dark: ReferenceColor.p.shade50);
  Color get primaryFilledTextColor => getColor(light: ReferenceColor.s.shade90, dark: ReferenceColor.s.shade90);

  Color get secondaryFilledBgHover => getColor(light: ReferenceColor.n.shade20, dark: ReferenceColor.n.shade96);

  //Tonal
  Color get primaryTonalBgHover => getColor(light: ReferenceColor.p.shade98, dark: ReferenceColor.p.shade20);
  Color get primaryTonalBgOnPress => getColor(light: ReferenceColor.p.shade96, dark: ReferenceColor.p.shade10);
  //Text
  Color get primaryTextBgOnPress => getColor(light: ReferenceColor.p.shade98, dark: ReferenceColor.p.shade0);
  Color get primaryTextTextColor => getColor(light: ReferenceColor.p.shade50, dark: ReferenceColor.p.shade96);
  //Outlined
  Color get primaryOutlinedBgOnPress => getColor(light: ReferenceColor.p.shade98, dark: ReferenceColor.p.shade0);
  Color get primaryOutlinedTextColor => getColor(light: ReferenceColor.p.shade50, dark: ReferenceColor.p.shade96);
  //endregion

  ///Helper Method
  Color getColor({required Color light, required Color dark}) => brightness == Brightness.light ? light : dark;
}