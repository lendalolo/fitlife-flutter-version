import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../../../../../common/colo_extension.dart';
import '../../../../../common/styles.dart';

class CaloriesAnimationProgressIndicator extends StatelessWidget {
  final double quantity;
  final  String text ;
  const CaloriesAnimationProgressIndicator({
    super.key,
    required this.media, required this.quantity, required this.text,
  });

  final Size media;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        // width: 200,
        // height: 200,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
                width: 80,
                height: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: TColor.kmainGradint,
                  borderRadius: BorderRadius.circular(
                      media.width * 0.75),
                ),
                child:  Text(
                  "${quantity}${text}",
                  textAlign: TextAlign.center,
                  style: Styles.kFontSize11,
                )
            ),
            SimpleCircularProgressBar(
              mergeMode: true,
              animationDuration: 8,
              progressStrokeWidth: 10,
              backStrokeWidth: 10,
              progressColors: TColor.primaryG,
              backColor: Colors.grey.shade100,
              fullProgressColor: TColor.secondaryColor2,
              valueNotifier: ValueNotifier(quantity),
              startAngle: 0,
            ),
          ],
        ),
      ),
    );
  }
}