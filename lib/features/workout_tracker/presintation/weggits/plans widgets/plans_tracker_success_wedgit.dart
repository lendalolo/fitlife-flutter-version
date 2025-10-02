import 'package:fitness/features/workout_tracker/presintation/weggits/plans%20widgets/update_plans_work_session.dart';
import 'package:flutter/material.dart';

import '../../../../../common/localization/applocalizations.dart';
import '../../../../../common/styles.dart';
import '../../../../../common_widget/custtom_app_title.dart';
import '../../../../../common_widget/custtom_bar_graph.dart';
import '../../../data/models/plans_statestics.dart';

class plans_tracker_success_wedgit extends StatelessWidget {
  final PlansStatesitics state;
  const plans_tracker_success_wedgit({
    super.key,
    required this.media, required this.state,
  });

  final Size media;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CusttomAppTitle(
              title: AppLocalazations.of(context)!
                  .translate("plans statistic")["My Rate"]),
          const SizedBox(
            height: 10,
          ),
          UpdatePlansWorkSession(
            media: media,
            state: state,
          ),
          SizedBox(
            height: media.width * 0.1,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       AppLocalazations.of(context)!.translate(
          //           "plans statistic")["Activity  Progress"],
          //       style: Styles.kFontSize16,
          //     ),
          //     // CusttomDropMenu(items: const ["Weekly", "Monthly"], onChanged: (String? value) {
          //     //   BlocProvider.of<ExerciesDataBloc>(context).add(ExerciesDataEvent(value!));
          //     // },),
          //   ],
          // ),
          // SizedBox(
          //   height: media.width * 0.05,
          // ),
          // CusttomBarGraph(
          //   x: state.data!.dayx,
          //   y: state.data!.dayy,
          // ),
          // SizedBox(
          //   height: media.width * 0.1,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalazations.of(context)!.translate(
                  "plans statistic")["Calories Burn"],
                style: Styles.kFontSize16,
              ),
              // CusttomDropMenu(items: const ["Weekly", "Monthly"], onChanged: (String? value) {
              //   BlocProvider.of<ExerciesDataBloc>(context).add(ExerciesDataEvent(value!));
              // },),
            ],
          ),
          SizedBox(
            height: media.width * 0.05,
          ),
          CusttomBarGraph(
            x: state.data!.calx,
            y: state.data!.caly, lengthOfTheBar: state.data!.lenghtOfY.toDouble(),
          ),
          SizedBox(
            height: media.width * 0.05,
          ),
        ],
      ),
    );
  }
}