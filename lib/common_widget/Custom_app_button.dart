import 'package:fitness/common/styles.dart';
import 'package:fitness/common_widget/GradintText.dart';
import 'package:flutter/material.dart';
import '../../../../../common/colo_extension.dart';


class CusttomAppButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double fontSize;
  final double elevation;
  final FontWeight fontWeight;
  final bool isActive;
  final IconData?  icon;

  const CusttomAppButton(
      {super.key,
        required this.title,
        this.fontSize = 16,
        this.elevation = 1,
        this.fontWeight= FontWeight.w700,
        required this.onPressed,  this.isActive = true, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient:isActive? TColor.kmainGradint:TColor.kgrayGradint,borderRadius: BorderRadius.all(Radius.circular(25))),
      child: MaterialButton(
        onPressed:isActive? onPressed:(){},
        height: 50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        minWidth: double.maxFinite,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon!=null?Icon(icon,color: TColor.white,):SizedBox(),
            icon!=null?SizedBox(width: 30,):SizedBox(),
            Text(title,style: Styles.kFontSize16.copyWith(color: TColor.white),),
          ],
        ),
      ),
    );
  }
}

class CusttomUnabelAppButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double fontSize;
  final double elevation;
  final FontWeight fontWeight;

  const CusttomUnabelAppButton(
      {super.key,
        required this.title,
        this.fontSize = 16,
        this.elevation = 1,
        this.fontWeight= FontWeight.w700,
        required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(color: TColor.gray,borderRadius: BorderRadius.all(Radius.circular(25))),
      child: MaterialButton(

        onPressed: onPressed,
        height: 50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        minWidth: double.maxFinite,
        elevation: 0,
        child: Text(title,style: Styles.kFontSize16.copyWith(color: TColor.white),),
      ),
    );
  }
}