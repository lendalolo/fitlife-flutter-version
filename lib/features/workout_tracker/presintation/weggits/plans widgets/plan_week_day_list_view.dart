import 'package:fitness/features/workout_tracker/presintation/weggits/plans%20widgets/plans_day_weak_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../common/utls/name_class.dart';
import '../../../data/models/plans_model.dart';
class PlanWeekDayListView extends StatelessWidget {
  final plans state;
  final int mindex;
  final int PlanIdForExercies;
  final  int dateLinght;
  const PlanWeekDayListView({
    super.key, required this.state, required this.mindex, required this.PlanIdForExercies,required this.dateLinght,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 15,
        );
      },
      itemCount: dateLinght,
      itemBuilder: ((context, index) {
        return PlansDayWeakWidget(
          isLast: !(index < dateLinght-1),
          //state.data!.last == state.data![index],
          index: index,
          ontap:(dayIndex) {
            GoRouter.of(context).push(Names.showExercies,
                extra:{'planId':PlanIdForExercies,'weakId':(index+1).toInt(),'dayId':(dayIndex+1).toInt(),'planIdForExercies':PlanIdForExercies} );
          }, isCheckedList: state.dateList!, holidayList: state.isHoleday!,
        );
      }),
    );
    //state.data![mindex].planLevels!.plan!.id!.toInt()
  }
}