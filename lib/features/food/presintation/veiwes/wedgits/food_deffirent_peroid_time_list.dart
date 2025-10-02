import 'package:flutter/material.dart';

import 'find_eat_cell.dart';

class FoodDeffirentPeroidTimeList extends StatelessWidget {
  const FoodDeffirentPeroidTimeList({
    super.key,
    required this.media,
    required this.findEatArr, required this.lenght,
  });

  final Size media;
  final List findEatArr;
  final int lenght;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: media.width * 0.50,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          scrollDirection: Axis.horizontal,
          itemCount: findEatArr.length,
          itemBuilder: (context, index) {
            var fObj = findEatArr[index] as Map? ?? {};
            return FoodPeriodItem(
              fObj: fObj,
              index: index, length: lenght,
            );
          }),
    );
  }
}