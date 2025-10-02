import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/api_servieses.dart';
import '../../../../../common/common blocs/languge blocs/languge_bloc.dart';
import '../../../../../common/localization/applocalizations.dart';
import '../../../../../common/utls/name_class.dart';
import '../../../../../common_widget/image_error_container.dart';
import '../../../../workout_tracker/presintation/views_bloc/plans bloc/plans_bloc.dart';
import '../../../data/models/all_meals.dart';

class PopularMealRow extends StatelessWidget {
  final dynamic mObj;
  final bool isFromTodatTarget;
  const PopularMealRow({super.key, required this.mObj, required this.isFromTodatTarget});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: TColor.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: CachedNetworkImage(
                errorWidget: (context, url, error) =>
                    const ImageErrorContainer(),
                imageUrl:
                    '$imageBaseUrl${mObj.media![0].originalUrl!.split('8000/').last}',
                width: 50,
                height: 50,
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
                  BlocBuilder<LangugeBloc, LangugeState>(
                    builder: (context, state) {
                      return Text(
                        state.locale == Locale('ar')
                            ? mObj.titleAr!
                            : mObj.title!,
                        style: Styles.kFontSize14.copyWith(
                            color: TColor.black, fontWeight: FontWeight.w500),
                      );
                    },
                  ),
                  Text(
                    "${mObj.fats}${AppLocalazations.of(context)!.translate("Meals Planer")["fats"]} | ${mObj.proteins}${AppLocalazations.of(context)!.translate("Meals Planer")["protiens"]} | ${mObj.calories}${AppLocalazations.of(context)!.translate("Meals Planer")["Cal"]}",
                    style: Styles.kFontSize12.copyWith(color: TColor.gray),
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: () async {
               await GoRouter.of(context).pushNamed(Names.FoodInfoDetailsView, extra: mObj.id);
               if(isFromTodatTarget) {
                 BlocProvider.of<PlansBloc>(context).add(GetTodatTargetEvent());
               }
              },
              icon: Image.asset(
                "assets/img/next_icon.png",
                width: 25,
                height: 25,
              ),
            )
          ],
        ));
  }
}
