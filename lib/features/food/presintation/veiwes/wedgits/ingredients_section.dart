import 'package:flutter/material.dart';
import '../../../../../common/colo_extension.dart';
import '../../../../../common/localization/applocalizations.dart';
import '../../../../../common_widget/custtom_app_title.dart';
import '../../../data/models/meal_detailes.dart';
import 'ingreadient_item.dart';

class IngredientsSection extends StatelessWidget {
  final Size media;

  final List<Ingredients> ingredientsArr;
  const IngredientsSection(
      {super.key, required this.media, required this.ingredientsArr});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CusttomAppTitle(title: "${AppLocalazations.of(context)!.translate("Meals Planer")["Ingredients That You\nWill Need"]}"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "${ingredientsArr.length} Items",
                style: TextStyle(color: TColor.gray, fontSize: 12),
              ),
            )
          ],
        ),
        SizedBox(
          height: (media.width * 0.4) + 40,
          child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: ingredientsArr.length,
              itemBuilder: (context, index) {
                return IngreadientItem(
                  media: media,
                  nObj: ingredientsArr[index],
                );
              }),
        )
      ],
    );
  }
}
