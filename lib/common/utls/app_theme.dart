import 'package:flutter/material.dart';
import '../colo_extension.dart';
enum AppTheme {light, dark}
final appThemeData ={
 AppTheme.light : ThemeData(
   brightness: Brightness.light,
   canvasColor: TColor.lightGray,
   primaryColor: TColor.primaryColor1,
   fontFamily: "Poppins",
   colorScheme:  ColorScheme.light(
     primary:TColor.primaryColor1,primaryContainer: TColor.white,
     //background: Colors.blue, scafoold bagrond color
   //  onBackground: Colors.white,
   //  surface: Colors.pink, buttom color
   // onSurface: Colors.white,
      ),
   datePickerTheme:  DatePickerThemeData(
     backgroundColor: TColor.white,
     dividerColor: TColor.primaryColor1,
     headerBackgroundColor: TColor.primaryColor1,
     headerForegroundColor: TColor.white,
   ),
   // dropdownMenuTheme: DropdownMenuThemeData(
   //     inputDecorationTheme: InputDecorationTheme(fillColor: TColor.primaryColor1,st))
 ),
  AppTheme.dark : ThemeData(
textTheme: TextTheme(
bodyLarge: TextStyle(),
bodyMedium: TextStyle(),
  bodySmall: TextStyle(),

).apply(
bodyColor: TColor.white,
),
    brightness: Brightness.dark,
    primaryColor: TColor.primaryColor2,
    fontFamily: "Poppins",
    colorScheme:  ColorScheme.dark(primary:TColor.primaryColor1, primaryContainer: TColor.primaryColor2.withOpacity(.2)
    ),
  ),
};