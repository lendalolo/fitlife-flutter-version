
import 'package:fitness/common_widget/custtom_read_more_descriptons.dart';
import 'package:fitness/features/workout_tracker/presintation/views_bloc/add%20goal%20bloc/add_goal_dayes_or_not_bloc.dart';
import 'package:fitness/features/workout_tracker/presintation/views_bloc/plans%20bloc/plans_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../common/colo_extension.dart';
import '../../../../../common/common blocs/languge blocs/languge_bloc.dart';
import '../../../../../common/errors/show_error_dialoge_messeage.dart';
import '../../../../../common/errors/show_goal_dialoge_messeage.dart';
import '../../../../../common/localization/applocalizations.dart';
import '../../../../../common_widget/bottom_snackbar_message.dart';
import '../../../../../common_widget/icon_title_next_row.dart';
import '../../../data/models/goales_model.dart';
import '../../../../../common_widget/app_body_topper_dash.dart';
import '../../../../../common_widget/custtom_detailes_wedgit.dart';
import 'muscles_counter_widget.dart';
import 'muscules_wedgit.dart';

class PlansBody extends StatelessWidget {
  final Size media;
  final Data dObj;
  const PlansBody({super.key, required this.media, required this.dObj});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LangugeBloc, LangugeState>(
  builder: (context, langstate) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: ThemeData.light().scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            BlocListener<PlansBloc, PlansState>(
              listener: (context, state) {
                if (state is PlansSuccess && state.plan.date!.isEmpty &&  state.plan.type == "expire" ) {
                  showGoalDialogMesseage(
                    context1: context,
                    state: 'Your goal is expired. Do you want to add some days?',
                    ontaptry: () {
                      BlocProvider.of<AddGoalDayesOrNotBloc>(context).add(AddGoalDayes());
                      GoRouter.of(context).pop();
                    },
                    ontapcancel: () {
                      BlocProvider.of<AddGoalDayesOrNotBloc>(context).add(NoAddGoalDayes());
                      GoRouter.of(context).pop();
                    },
                  );
                }
              },
              child: BlocConsumer<AddGoalDayesOrNotBloc, AddGoalDayesOrNotState>(
                listener: (context, state) {
                  if (state is AddGoalDayesSuccess || state is NoAddGoalDayesSuccess) {
                    BlocProvider.of<PlansBloc>(context).add(PlansEvent(dObj.id!));
                    bottomSnackbarMassage(context: context, message: 'Success');
                  } else if (state is AddGoalDayesFailed || state is NoAddGoalDayesFailed) {
                    showGoalDialogMesseage(
                      context1: context,
                      state: 'It failed. Try again',
                      ontaptry: () {
                        BlocProvider.of<AddGoalDayesOrNotBloc>(context).add(AddGoalDayes());
                        GoRouter.of(context).pop();
                      },
                      ontapcancel: () {
                        BlocProvider.of<AddGoalDayesOrNotBloc>(context).add(NoAddGoalDayes());
                        GoRouter.of(context).pop();
                      },
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AddGoalDayesLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return SingleChildScrollView(
                    child: Column(children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const AppBodyTopperDash(),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      CusttomDetailesWedgit(title: langstate.locale == Locale('ar')
                          ? dObj.titleAr.toString()
                          : dObj.title.toString(),
                        SubTitle:  "${dObj.caloriesMin.toString()}/${dObj.caloriesMax.toString()} ${AppLocalazations.of(context)!.translate('GoalsPage')['calories']} | ${dObj.duration.toString()} ${AppLocalazations.of(context)!.translate('GoalsPage')['month']}",
                      ),
                      SizedBox(
                        height: media.width * 0.02,
                      ),
                      CusttomReadMorDescription(test:langstate.locale ==Locale('ar')?dObj.descriptionAr!:
                      dObj.description!),
                      //const SizedBox(height: 10),
                      // IconTitleNextRow(
                      //     icon: "assets/img/time.png",
                      //     title: "Schedule Workout",
                      //     time: "5/27, 09:00 AM",
                      //     color: TColor.primaryColor2.withOpacity(0.3),
                      //     onPressed: () {
                      //       GoRouter.of(context).pushNamed(Names.WorkoutScheduleView);
                      //     }),
                      // SizedBox(
                      //   height: media.width * 0.02,
                      // ),
                      // IconTitleNextRow(
                      //     icon: "assets/img/difficulity.png",
                      //     title: "Difficulity",
                      //     time: "Beginner",
                      //     color: TColor.secondaryColor2.withOpacity(0.3),
                      //     onPressed: () {}),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              langstate.locale ==const Locale('ar')?"${AppLocalazations.of(context)!.translate('GoalsPage')["Planes"]} " "${dObj.titleAr.toString()}":"${dObj.title.toString()}""${AppLocalazations.of(context)!.translate('GoalsPage')["Planes"]}",
                              style: TextStyle(
                                  color: TColor.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                            const MusclesCouterWedgit()
                          ],
                        ),
                      ),
                      MusclesWedgit(dObj:dObj,),
                      SizedBox(
                        height: media.width * 0.2,
                      ),
                    ],),
                  ); // Nothing else to build
                },
              ),
            ),
          ],
        ),
      ),
    );
  },
);
  }
}
bool checkIfDatePassed(String dateStr) {
  // Parse the given date string (format: yyyy-M-d)
  DateTime targetDate = DateTime.parse(dateStr);

  // Get today's date without time (for clean comparison)
  DateTime today = DateTime.now();
  DateTime currentDate = DateTime(today.year, today.month, today.day);

  if (currentDate.isBefore(targetDate)) {
  return false;
  } else if (targetDate.isAtSameMomentAs(currentDate)) {
   return false;
  } else {
    print("The date is in the future.");
    return true;
  }
}

