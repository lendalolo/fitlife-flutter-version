import 'package:bloc/bloc.dart';
import 'package:fitness/features/workout_tracker/data/models/Exercies_submit.dart';
import 'package:fitness/features/workout_tracker/data/models/plans_statestics.dart';
import 'package:fitness/features/workout_tracker/data/models/regester_in_goal_model.dart';
import 'package:fitness/features/workout_tracker/data/models/today_target_model.dart';
import 'package:fitness/features/workout_tracker/data/repo/plans_repo.dart';
import '../../../data/models/exercieses_model.dart';
import '../../../data/models/plans_model.dart';

part 'plans_event.dart';
part 'plans_state.dart';

class PlansBloc extends Bloc<MusclesEvent, PlansState> {
  final PlansRepo plansRepo;
  PlansBloc(this.plansRepo) : super(PlansInitial()) {
    on<PlansEvent>((event, emit) async{
     emit(PlansLoading());
     var result =await plansRepo.fetchPlans(event.num);
     result.fold((failed) =>emit(PlansFailed(failed.errMassage,failed.obj)) ,
           (plan) {
             emit(PlansSuccess(plan));
        //     add(ExerciesEvent(plan.data![0].planLevels!.plan!.id!.toInt()));
           },);
    });
    on<ExerciesEvent>((event, emit) async{
      emit(ExerciesLoading());
      var result =await plansRepo.fetchPlansExercies(event.num);
      result.fold((failed) =>emit(ExerciesFailed(failed.errMassage,failed.obj)) ,
            (plan) => emit(ExerciesSuccess(plan)),);
    });
    on<ExerciesSubmitEvent>((event, emit) async{
      emit(ExerciesSubmitLoading());
      var result =await plansRepo.submitExercies(event.check, event.planId, event.calories);
      result.fold((failed) =>emit(ExerciesSubmitFailed(failed.errMassage)) ,
            (Exerciesstate) => emit(ExerciesSubmitSuccess(Exerciesstate)),);
    });
    on<GetTodatTargetEvent>((event, emit) async{
      emit(TodayTargetLoading());
      var result =await plansRepo.fetchTodayTarget();
      result.fold((failed) =>emit(TodayTargetFailed(failed.errMassage,failed.obj)) ,
            (today) => emit(TodayTargetSuccess(today)),);
    });
    on<GetPlansStaticticsEvent>((event, emit) async{
      emit(PlansStatisticsLoading());
      var result =await plansRepo.FetchPlaneStatistics(event.planId);
      result.fold((failed) =>emit(PlansStatisticsFailed(failed.errMassage,failed.obj)) ,
            (plan) => emit(PlansStatisticsSuccess(plan)),);
    });
  }

}
//