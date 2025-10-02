import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/common/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void bottomSnackbarMassage({ required BuildContext context,required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content:  Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          gradient: TColor.kmainGradint
      ),
      child: Text(message,textAlign: TextAlign.center,style: Styles.kFontSize14.copyWith(color: TColor.white),),
    ),
    backgroundColor: Colors.transparent,
    padding: const EdgeInsets.all(2),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    duration: const Duration(seconds: 3),
    dismissDirection: DismissDirection.none,
    margin:const EdgeInsets.all(16)
  ),);
}
