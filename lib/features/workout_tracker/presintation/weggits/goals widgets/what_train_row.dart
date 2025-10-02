import 'package:fitness/common/localization/applocalizations.dart';
import 'package:fitness/common/styles.dart';
import 'package:fitness/common/utls/name_class.dart';
import 'package:fitness/common_widget/round_button.dart';
import 'package:flutter/material.dart';
import 'package:fitness/common/api_servieses.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../common/colo_extension.dart';
import '../../../../../common/common blocs/languge blocs/languge_bloc.dart';
import '../../../../../common_widget/custtom_image_with_white_backgroung.dart';
import '../../../data/models/goales_model.dart';

class WhatTrainRow extends StatelessWidget {
  final Data wObj;
  const WhatTrainRow({super.key, required this.wObj});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        gradient: TColor.lineChartGradient,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<LangugeBloc, LangugeState>(
                  builder: (context, state) {
                    return Text(
                      state.locale == Locale('ar')
                          ? wObj.titleAr.toString()
                          : wObj.title.toString(),
                      style: Styles.kFontSize14.copyWith(
                          color: TColor.black, fontWeight: FontWeight.w500),
                    );
                  },
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "${wObj.caloriesMin.toString()}/${wObj.caloriesMax.toString()}${AppLocalazations.of(context)!.translate("GoalsPage")["calories"]} | ${wObj.duration.toString()}${AppLocalazations.of(context)!.translate("GoalsPage")["month"]}",
                  style: Styles.kFontSize12.copyWith(color: TColor.gray),
                ),
                const SizedBox(
                  height: 10,
                ),
                RoundButton(
                    height: 30,
                    minWidth: 100,
                    title: AppLocalazations.of(context)!
                        .translate("GoalsPage")["View Plans"],
                    fontSize: 10,
                    elevation: 0.05,
                    fontWeight: FontWeight.w400,
                    onPressed: () {
                      GoRouter.of(context)
                          .pushNamed(Names.WorkoutDetailView, extra: wObj);
                    })
              ],
            ),
          ),
          CustomImageWithWithBackground(
            ImageName:
                '$imageBaseUrl${wObj.media![0].originalUrl!.split('8000/').last}',
            imageWidth: 80,
            imageHight: 80,
            witheBackgroungWidth: 90,
            witheBackgroungHight: 90,
          ),
        ],
      ),
    );
  }
}
