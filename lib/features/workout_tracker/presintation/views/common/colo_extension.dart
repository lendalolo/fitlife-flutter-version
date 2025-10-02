
import 'package:flutter/material.dart';

class TColor {
  static const  Color primaryColor1 =  Color(0xff92A3FD);
  static  const Color primaryColor2 =  Color(0xff9DCEFF);

  static  const Color secondaryColor1 =  Color(0xffC58BF2);
  static const Color  secondaryColor2 = Color(0xffEEA4CE);

  static const List<Color> primaryG = [primaryColor2, primaryColor1];
  static List<Color> primaryGWithOpacity =[
  primaryColor2.withOpacity(0.5),
  primaryColor1.withOpacity(0.5)
  ];
  static List<Color> secondaryGWithOpacity =[
    secondaryColor2.withOpacity(0.5),
    secondaryColor1.withOpacity(0.5)
  ];
  static const List<Color>  secondaryG = [secondaryColor2, secondaryColor1];
  static const List<BoxShadow> kBoxShadow =[BoxShadow(color: Colors.black12,blurRadius: 2,offset: Offset(0, 1))];
  static const LinearGradient kmainGradint =LinearGradient(
  colors: TColor.primaryG,
  begin: Alignment.centerLeft,
  end: Alignment.centerRight
  );
  static const LinearGradient kcardGradiant = LinearGradient(
      colors: TColor.primaryG,
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);
  static const LinearGradient kwaterTextGradient =LinearGradient(
      colors: TColor.secondaryG,
      begin: Alignment.centerLeft,
      end: Alignment.centerRight);

  static const LinearGradient kFoodBarGradient = LinearGradient(
  colors: TColor.primaryG,
  begin: Alignment.centerLeft,
  end: Alignment.centerRight);

  static  LinearGradient lineChartGradient = LinearGradient(colors: [
    TColor.primaryColor2.withOpacity(0.4),
    TColor.primaryColor1.withOpacity(0.4),
  ]);
  static  LinearGradient SecondraylineChartGradient = LinearGradient(colors: [
  TColor.secondaryColor2.withOpacity(0.5),
  TColor.secondaryColor1.withOpacity(0.5),
  ]);

  static Color get black => const Color(0xff1D1617);
  static Color get gray => const Color(0xff786F72);
  static Color get white => Colors.white;
  static Color get lightGray => const Color(0xffF7F8F8);

}
