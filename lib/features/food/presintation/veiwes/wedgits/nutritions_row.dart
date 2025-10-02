import 'package:flutter/material.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

import '../../../../../common/colo_extension.dart';
import '../../../../../common/styles.dart';

class NutritionRow extends StatelessWidget {
  final num nObj;
  final int index;
  const NutritionRow({super.key, required this.nObj, required this.index});

  @override
  Widget build(BuildContext context) {
     var media = MediaQuery.of(context).size;
      var val = nObj;
    var maxVal =500;
    final  nutritionArr = [
       {
         "title": "Calories",
         "image": "assets/img/burn.png",
         "unit_name": "kCal",
         "max_value": "500",
       },
       {
         "title": "Proteins",
         "image": "assets/img/proteins.png",
         "unit_name": "g",
         "max_value": "1000",
       },
       {
         "title": "Fats",
         "image": "assets/img/egg.png",
         "unit_name": "g",
         "max_value": "1000",
       },
       {
         "title": "Carbo",
         "image": "assets/img/carbo.png",
         "unit_name": "g",
         "max_value": "1000",
       },
     ];
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Column(children: [
        Row(
          children: [
            Text(
              nutritionArr[index]["title"].toString(),
              style: Styles.kFontSize12.copyWith(color: TColor.gray),
            ),
            const SizedBox(
              width: 4,
            ),
            Image.asset(
              nutritionArr[index]["image"].toString(),
              width: 15,
              height: 15,
            ),
            const Spacer(),
            Text(
              "${nObj} ${nutritionArr[index]["unit_name"].toString()}",
              style:  Styles.kFontSize11.copyWith(color: TColor.gray),
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        SimpleAnimationProgressBar(
          height: 10,
          width: media.width - 30,
          backgroundColor: Colors.grey.shade100,
          ratio: val / maxVal,
          direction: Axis.horizontal,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: const Duration(seconds: 3),
          borderRadius: BorderRadius.circular(7.5),
          gradientColor: TColor.kFoodBarGradient, foregroundColor:  Colors.purple,)
      ]),
    );
  }
}