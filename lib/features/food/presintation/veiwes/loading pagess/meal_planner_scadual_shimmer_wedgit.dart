import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../common/colo_extension.dart';
import '../../../../../common/localization/applocalizations.dart';
import '../../../../../common/styles.dart';
import '../../../../../common_widget/custtom_bar_graph.dart';
import '../../../../home/presintation/views/widgets/today_target_widget.dart';
import '../../../../home/presintation/views_blocs/Exersices data/exercies_data_bloc.dart';
import '../meal_schedule_view.dart';
import '../wedgits/custtom_drop_menu.dart';
import '../wedgits/food_deffirent_peroid_time_list.dart';
class MealPlannerScadualShimmerWedgit extends StatelessWidget {
  const MealPlannerScadualShimmerWedgit({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      baseColor: TColor.primaryColor2.withOpacity(0.4),
      highlightColor: Colors.grey[100]!,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalazations.of(context)!
                            .translate("Meals Planer")["Meal Nutritions"],
                        style: Styles.kFontSize16,
                      ),
                      Container(
                        height: 30,
                        width: 100,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          gradient: TColor.kmainGradint,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  CusttomBarGraph(x: [], y: [], lengthOfTheBar: 100,),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  TodayTargetWidget(
                    text: AppLocalazations.of(context)!
                        .translate("Meals Planer")["Daily Meal Schedule"],
                    ontap: () {
                    },
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  AppLocalazations.of(context)!
                      .translate("Meals Planer")["Choose the food"],
                  style: Styles.kFontSize16,)
            ),
            FoodDeffirentPeroidTimeList(media: media, findEatArr: eat, lenght: 50,
           ),
            SizedBox(
              height: media.width * 0.05,
            ),
          ],
        ),
      ),
    );

  }
}
final List<Map> eat= [
{
"name": "snacks",
"image": "assets/img/m_1.png",
"number": "120+ Foods"
},
{"name": "Dinner", "image": "assets/img/m_2.png", "number": "130+ Foods"},
{
"name": "Breakfast",
"image": "assets/img/m_3.png",
"number": "120+ Foods"
},
{"name": "Lunch", "image": "assets/img/m_4.png", "number": "130+ Foods"},

];