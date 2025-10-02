import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../common/colo_extension.dart';
import '../../../../../common/localization/applocalizations.dart';
import '../../../../../common/styles.dart';
import '../../../../../common_widget/custtom_app_title.dart';
import '../../../../../common_widget/custtom_image_with_white_backgroung.dart';
import '../wedgits/meal_category_cell.dart';

class FoodCategoresWidgetShimmerLoading extends StatelessWidget {
  const FoodCategoresWidgetShimmerLoading({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: TColor.primaryColor2.withOpacity(0.4),
      highlightColor: Colors.grey[100]!,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CusttomAppTitle(title:  AppLocalazations.of(context)!
                .translate("Meals Planer")["Category"],),
            SizedBox(
              height: 120,
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    List categoryArr = [
                      {
                        "name": "Salad",
                        "image": "assets/img/chicken.png",
                      },
                      {
                        "name": "Cake",
                        "image": "assets/img/c_2.png",
                      },
                      {
                        "name": "Pie",
                        "image": "assets/img/c_3.png",
                      },
                      {
                        "name": "Smoothies",
                        "image": "assets/img/c_4.png",
                      },
                      {
                        "name": "Salad",
                        "image": "assets/img/c_1.png",
                      },
                      {
                        "name": "Cake",
                        "image": "assets/img/c_2.png",
                      },
                      {
                        "name": "Pie",
                        "image": "assets/img/c_3.png",
                      },
                      {
                        "name": "Smoothies",
                        "image": "assets/img/c_4.png",
                      },
                    ];
                    var cObj = categoryArr[index] as Map? ?? {};
                    return Container(
                      margin: const EdgeInsets.all(4),
                      width: 80,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: TColor.secondaryGWithOpacity,
                          ),
                          borderRadius:  BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(cObj["image"].toString(),width: 35,height: 35,),
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                              child: Text(
                                cObj["name"],
                                maxLines: 1,
                                style:Styles.kFontSize12.copyWith(color: TColor.gray),)
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );

  }
}