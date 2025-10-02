import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/common/styles.dart';
import 'package:fitness/common_widget/meal_food_schedule_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/api_servieses.dart';
import '../../../../../common/utls/name_class.dart';
import '../../../../../common_widget/custtom_app_image_with_gradient_backgroung.dart';
import '../../../data/models/today_target_model.dart';
import '../../views_bloc/plans bloc/plans_bloc.dart';

class LatestActivityRow extends StatelessWidget {
  final int index;
  final int planId;
  final Exercise wObj;
  const LatestActivityRow({super.key, required this.wObj, required this.index, required this.planId});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            CusttomAppImageWithGradentBackground(index: index, image:  wObj.media!.isNotEmpty?'$imageBaseUrl${wObj.media![0].originalUrl!.split('8000/').last}':''),
           const SizedBox(width: 15,),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text(
                  wObj.title!,
                  style: Styles.kFontSize12.copyWith(color: TColor.black),
                ),

                Text(
                 wObj.calories!.toString(),
                  style:Styles.kFontSize10,)
              ],
            )),
            IconButton(
                onPressed: ()  async {
                await  GoRouter.of(context).push(Names.ExercisesStepDetails,extra:[wObj.id!,wObj.title,planId,wObj.titleAr] );
                 // BlocProvider.of<PlansBloc>(context).add(ExerciesEvent(wObj.id!));
                  BlocProvider.of<PlansBloc>(context).add(GetTodatTargetEvent());
                //  //
                },
                icon: Image.asset(
                  "assets/img/next_icon.png",
                  width: 25,
                  height: 25,
                  fit: BoxFit.contain,
                ))
          ],
        ));
  }
}
