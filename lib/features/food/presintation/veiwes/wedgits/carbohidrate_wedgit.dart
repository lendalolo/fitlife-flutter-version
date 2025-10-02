
import 'package:fitness/common/styles.dart';
import 'package:flutter/material.dart';

import '../../../../../common/colo_extension.dart';
import '../../../../../common/localization/applocalizations.dart';
import '../../../../../common_widget/custtom_app_title.dart';
import '../../../data/models/meal_detailes.dart';
import 'carbohidrate_item.dart';
class CarbohidrateWedgit extends StatelessWidget {
  static const List nutritionArr = [
    {"image": "assets/img/burn.png", "title": "180kCal"},
    {"image": "assets/img/egg.png", "title": "30g fats"},
    {"image": "assets/img/proteins.png", "title": "20g proteins"},
    {"image": "assets/img/carbo.png", "title": "50g carbo"},
  ];

  const CarbohidrateWedgit({super.key, required this.list});
final MealDetailes list;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CusttomAppTitle(title: "${AppLocalazations.of(context)!.translate("Meals Planer")["Nutrition"]}"),
        SizedBox(
          height: 50,
          child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                var nObj = nutritionArr[index] as Map? ?? {};
               List<Map<String,int> >  nut =[];
               nut.addAll([
                 {"${AppLocalazations.of(context)!.translate("Meals Planer")["Cal"]}": list.data!.calories!},{"${AppLocalazations.of(context)!.translate("Meals Planer")["fats"]}":list.data!.fats!},{"${AppLocalazations.of(context)!.translate("Meals Planer")["protiens"]}":list.data!.proteins!},{"${AppLocalazations.of(context)!.translate("Meals Planer")["carbo"]}":list.data!.carbohydrates!}]);
                return CarbohidrateItem(nObj: nObj, list: nut[index],);
              }),
        )
      ],
    );
  }
}

