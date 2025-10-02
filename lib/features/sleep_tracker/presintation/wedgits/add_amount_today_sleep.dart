import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/common/styles.dart';
import 'package:flutter/material.dart';

import '../../../../common/common.dart';


  class AddAmountTodaySleep extends StatefulWidget {
  final Map sObj;
    const AddAmountTodaySleep({super.key, required this.sObj});

  @override
      State<AddAmountTodaySleep> createState() => _AddAmountTodaySleepState();
}

    class _AddAmountTodaySleepState extends State<AddAmountTodaySleep> {
  bool positive = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: TColor.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]),
        child: Row(
          children: [
            const SizedBox(
              width: 15,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                widget.sObj["image"].toString(),
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.sObj["name"].toString(),
                    style: Styles.kFontSize14.copyWith(color: TColor.black,fontWeight: FontWeight.w700),
                  )
,
                  const SizedBox(height: 8,),
                  Text(
                    widget.sObj["duration"].toString(),
                    style: Styles.kFontSize14,
                  ),
                ],
              ),
            ),

          ],
        ));
  }
}
