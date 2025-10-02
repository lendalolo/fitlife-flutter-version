import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness/common/styles.dart';
import 'package:fitness/common_widget/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/api_servieses.dart';
import '../../../../../common/colo_extension.dart';
import '../../../../../common/common blocs/languge blocs/languge_bloc.dart';
import '../../../../../common/localization/applocalizations.dart';
import '../../../../../common/utls/name_class.dart';
import '../../../../../common_widget/image_error_container.dart';
import 'package:fitness/features/food/data/models/all_meals.dart';

class MealCell extends StatelessWidget {
  final Meal? state;
  final Map fObj;
  final int index;
  final bool isLoading;
  const MealCell(
      {super.key,
      required this.index,
      required this.fObj,
      required this.isLoading,
      this.state});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool isEvent = index % 2 == 0;
    return Container(
      margin: const EdgeInsets.all(5),
      width: media.width * 0.5,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isEvent
                ? TColor.primaryGWithOpacity
                : TColor.secondaryGWithOpacity,
          ),
          borderRadius: BorderRadius.circular(25)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isLoading
              ? Image.asset(
                  fObj["image"].toString(),
                  width: media.width * 0.3,
                  height: media.width * 0.25,
                  fit: BoxFit.contain,
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(70),
                  child: CachedNetworkImage(
                    errorWidget: (context, url, error) =>
                        const ImageErrorContainer(),
                    imageUrl:
                        '$imageBaseUrl${state!.media![0].originalUrl!.split('8000/').last}',
                    width: media.width * 0.3,
                    height: media.width * 0.25,
                    fit: BoxFit.cover,
                  ),
                ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: BlocBuilder<LangugeBloc, LangugeState>(
              builder: (context, mystate) {
                return Text(
                    mystate.locale.languageCode == 'ar'
                        ? isLoading
                            ? fObj["name"]
                            : state!.titleAr
                        : isLoading
                            ? fObj["name"]
                            : state!.title,
                    style: Styles.kFontSize14.copyWith(color: TColor.black));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              textAlign: TextAlign.center,
              isLoading
                  ? "${fObj["size"]} | ${fObj["time"]} | ${fObj["kcal"]}"
                  : "${state!.fats}${AppLocalazations.of(context)!.translate("Meals Planer")["fats"]} | ${state!.proteins}${AppLocalazations.of(context)!.translate("Meals Planer")["protiens"]} | ${state!.calories}${AppLocalazations.of(context)!.translate("Meals Planer")["Cal"]}",
              style: Styles.kFontSize12.copyWith(color: TColor.gray),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              width: 90,
              height: 35,
              child: RoundButton(
                  fontSize: 12,
                  title: AppLocalazations.of(context)!
                      .translate("Meals Planer")["View"],
                  onPressed: () {
                    GoRouter.of(context)
                        .pushNamed(Names.FoodInfoDetailsView, extra: state!.id!);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

List recommendArr = [
  {
    "name": "Honey Pancake",
    "image": "assets/img/rd_1.png",
    "size": "Easy",
    "time": "30mins",
    "kcal": "180kCal"
  },
  {
    "name": "Canai Bread",
    "image": "assets/img/m_4.png",
    "size": "Easy",
    "time": "20mins",
    "kcal": "230kCal"
  },
];
