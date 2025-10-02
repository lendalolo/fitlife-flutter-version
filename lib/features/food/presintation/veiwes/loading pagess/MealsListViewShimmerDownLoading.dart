import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../common/colo_extension.dart';
import '../../../../../common/localization/applocalizations.dart';
import '../../../../../common_widget/custtom_app_title.dart';
import '../wedgits/meal_cell.dart';
class MealsListViewShimmerLoading extends StatelessWidget {
  const MealsListViewShimmerLoading({
    super.key,
    required this.media,
    required this.recommendArr,
  });

  final Size media;
  final List recommendArr;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: TColor.primaryColor2.withOpacity(0.4),
      highlightColor: Colors.grey[100]!,
      child: SingleChildScrollView(
        child: Column(children: [
          CusttomAppTitle(title:  AppLocalazations.of(context)!
              .translate("Meals Planer")["Recommendation recipes"]),
          SizedBox(
            height: media.width * 0.6,
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                scrollDirection: Axis.horizontal,
                itemCount: recommendArr.length,
                itemBuilder: (context, index) {
                  var fObj = recommendArr[index] as Map? ?? {};
                  return MealCell(
                    fObj: fObj,
                    index: index, isLoading: true,
                  );
                }),
          ),
        ],),
      ),
    );


  }
}