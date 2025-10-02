import 'package:fitness/common/errors/show_error_dialoge_messeage.dart';
import 'package:fitness/common/styles.dart';
import 'package:fitness/common_widget/custtom_app_title_with_right_test.dart';
import 'package:fitness/common_widget/no_internet_no_cache_Widget.dart';
import 'package:fitness/features/food/presintation/veiwes/wedgits/app_bar_for_app_bar_property.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../common/localization/applocalizations.dart';
import '../../../../common_widget/custtom_app_title.dart';
import '../../../../common_widget/custtom_bar_graph.dart';
import '../../data/models/plans_statestics.dart';
import '../views_bloc/plans bloc/plans_bloc.dart';
import '../weggits/plans widgets/plans_tracker_success_wedgit.dart';
import '../weggits/plans widgets/update_plans_work_session.dart';

class PlansTrackerView extends StatefulWidget {
  final int PlanId;
  const PlansTrackerView({super.key, required this.PlanId});

  @override
  State<PlansTrackerView> createState() => _PlansTrackerViewState();
}

class _PlansTrackerViewState extends State<PlansTrackerView> {
  int touchedIndex = -1;

  List latestArr = [
    {
      "image": "assets/img/pic_4.png",
      "title": "Drinking 300ml Water",
      "time": "About 1 minutes ago"
    },
    {
      "image": "assets/img/pic_5.png",
      "title": "Eat Snack (Fitbar)",
      "time": "About 3 hours ago"
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CusttomAppBarForAppBarProberty(
          context: context, title:  AppLocalazations.of(context)!.translate(
          "plans statistic")["Activity  Progress"]),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: BlocConsumer<PlansBloc, PlansState>(
          listener: (context, state) {
            if (state is PlansStatisticsFailed) {
              showErrorDialogMesseage(
                context1: context,
                state: state.errorMessage,
                ontaptry: () {
                  BlocProvider.of<PlansBloc>(context)
                      .add(GetPlansStaticticsEvent(1));
                  GoRouter.of(context).pop();
                },
                ontapcancel: () {
                  GoRouter.of(context).pop();
                },
              );
            }
          },
          builder: (context, state) {
            if (state is PlansStatisticsSuccess) {
              return plans_tracker_success_wedgit(media: media, state: state.plansStatesitics,);
            }
            if (state is PlansStatisticsFailed) {
              {
                if (state.obj != Null) {
                  return plans_tracker_success_wedgit(media: media, state: state.obj.plansStatesitics,);
                }
                return NoInternetNoCachWedgit(
                  ontap: () {
                    BlocProvider.of<PlansBloc>(context)
                        .add((GetPlansStaticticsEvent(widget.PlanId)));
                  },
                );
              }
            }
            // {
            //   if(state.obj != Null)
            //     {
            //       return Column(
            //         children: [
            //           CusttomAppTitle(title: "upgrade"),
            //           const SizedBox(
            //             height: 10,
            //           ),
            //           UpdatePlansWorkSession(media: media, state: state.obj,),
            //           SizedBox(
            //             height: media.width * 0.1,
            //           ),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               const Text(
            //                 "Activity  Progress",
            //                 style: Styles.kFontSize16,
            //               ),
            //               CusttomDropMenu(items: const ["Weekly", "Monthly"], onChanged: (String? value) {
            //                 BlocProvider.of<ExerciesDataBloc>(context).add(ExerciesDataEvent(value!));
            //               },)
            //               ,
            //             ],
            //           ),
            //           SizedBox(
            //             height: media.width * 0.05,
            //           ),
            //           CusttomBarGraph(x: [], y: [],),
            //           SizedBox(
            //             height: media.width * 0.1,
            //           ),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               const Text(
            //                 "Calories Burn",
            //                 style: Styles.kFontSize16,
            //               ),
            //               CusttomDropMenu(items: const ["Weekly", "Monthly"], onChanged: (String? value) {
            //                 BlocProvider.of<ExerciesDataBloc>(context).add(ExerciesDataEvent(value!));
            //               },)
            //               ,
            //             ],
            //           ),
            //           SizedBox(
            //             height: media.width * 0.05,
            //           ),
            //           CusttomBarGraph(x: [], y: [],),
            //           SizedBox(
            //             height: media.width * 0.05,
            //           ),
            //           const CusttomAppTitle(title: "Latest Workout"),
            //           SizedBox(
            //             height: media.width * 0.1,
            //           ),
            //         ],
            //       );
            //     }
            //   else{
            //     return NoInternetNoCachWedgit(ontap: () {
            //       BlocProvider.of<PlansBloc>(context).add(GetTodatTargetEvent());
            //     },);
            //   }
            // }
            return Center(child: CircularProgressIndicator(),);
          },
        ),
      ),
    );
  }
}


