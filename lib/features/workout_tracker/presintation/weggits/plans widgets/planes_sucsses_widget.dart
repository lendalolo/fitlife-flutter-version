
import 'package:fitness/common/common%20blocs/languge%20blocs/languge_bloc.dart';
import 'package:fitness/common/utls/name_class.dart';
import 'package:fitness/features/workout_tracker/presintation/views_bloc/add%20goal%20bloc/add_goal_dayes_or_not_bloc.dart';
import 'package:fitness/features/workout_tracker/presintation/weggits/plans%20widgets/plan_week_day_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../common/api_servieses.dart';
import '../../../../../common/localization/applocalizations.dart';
import '../../../../../common/servies_locator.dart';
import '../../../../../common/user_not_sign_up_wedgit.dart';
import '../../../../home/presintation/views/widgets/today_target_widget.dart';
import '../../../data/models/plans_model.dart';
import '../../views_bloc/plans bloc/plans_bloc.dart';
import 'muscle_detailes_text.dart';
import 'muscle_image_widget.dart';
import '../../../../../common_widget/custtom_read_more_descriptons.dart';

class PlanesSuccessWedgit extends StatefulWidget {
  final plans plan;

  const PlanesSuccessWedgit({super.key, required this.plan});

  @override
  State<PlanesSuccessWedgit> createState() => _PlanesSuccessWedgitState();
}

int mindex = 0;

class _PlanesSuccessWedgitState extends State<PlanesSuccessWedgit> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Column(
      children: [
        getIt.get<SharedPreferences>().getString('user') == null || getIt.get<SharedPreferences>().getString('user')!.isEmpty?SizedBox():
        BlocBuilder<AddGoalDayesOrNotBloc, AddGoalDayesOrNotState>(
  builder: (context, state) {
    if(state is UserStatusGoalSuccessFood)
   {
     if (state.goalday.status == "subscription") {
       return TodayTargetWidget(text: AppLocalazations.of(context)!.translate("GoalsPage")["Daily Workout Schedule"],
         ontap: () { GoRouter.of(context).pushNamed(Names.PlansTrackerView,extra: widget.plan.data![mindex].planId! ); },);
     }
   }
    return SizedBox();
  },
),
        SizedBox(
          height: media.height * .3,
          child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: widget.plan.data!.length,
              itemBuilder: (context, index) {
                return Container(
                    margin: const EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () {
                        mindex = index;
                        setState(() {});
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MuscleImageWidget(
                            media: media,
                            imageUrl: '$imageBaseUrl${widget.plan.data![index].plan!.media![0].originalUrl!.split('8000/').last}',
                            index: index,
                          ),
                          MuscleDetailesText(
                            titleAr:widget.plan.data![index].plan!.titleAr.toString(),
                            titleEn:widget.plan.data![index].plan!.title.toString(),
                            index: index,
                          ),
                        ],
                      ),
                    ));
              }),
        ),
        BlocBuilder<LangugeBloc, LangugeState>(
          builder: (context, state) {
            return CusttomReadMorDescription(
              test: state.locale == const Locale('ar')
                  ? widget.plan.data![mindex].plan!.descriptionAr!
                  : widget.plan.data![mindex].plan!.description!,
            );
          },
        ),
        const SizedBox(height: 15),
        BlocBuilder<PlansBloc, PlansState>(
          builder: (context, state) {
            if(state is PlansSuccess) {
              if(state.plan.date!.isEmpty) {
                return UserNotSignUpWedgit(message: state.plan.message!,);
              } else {
                return PlanWeekDayListView(
              state: widget.plan,
              mindex: mindex, PlanIdForExercies: widget.plan.data![mindex].planId!, dateLinght:  (state.plan.date!.length/7).toInt(),
            );
              }
            }
            else if (state is ExerciesFailed){
              if(state.obj != Null)
                {
                  if(state.obj.date!.isEmpty) {
                    return UserNotSignUpWedgit(message: state.obj.message!,);
                  } else {
                    return PlanWeekDayListView(
                      state: widget.plan,
                      mindex: mindex,
                        PlanIdForExercies: widget.plan.data![mindex].planId!, dateLinght:  (state.obj.date!.length/7).toInt(),
                    );
                  }
                }
            }
            return const CircularProgressIndicator();
          },
        )
      ],
    );
  }
}


