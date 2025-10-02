import 'package:bloc/bloc.dart';
import 'package:fitness/features/workout_tracker/data/models/user_status_model.dart';
import 'package:meta/meta.dart';

import '../../../data/models/AddGoalMoreDay.dart';
import '../../../data/repo/goales_repo.dart';

part 'add_goal_dayes_or_not_event.dart';
part 'add_goal_dayes_or_not_state.dart';

class AddGoalDayesOrNotBloc extends Bloc<AddGoalDayesOrNotEvent, AddGoalDayesOrNotState> {
  final GoalsRepo goalsRepo;
  AddGoalDayesOrNotBloc(this.goalsRepo) : super(AddGoalDayesOrNotInitial()) {
    on<AddGoalDayes>((event, emit) async {
      emit(AddGoalDayesLoading());
      var result =await goalsRepo.addday();
      result.fold((failed) =>emit(AddGoalDayesFailed(failed.errMassage,failed.obj)) ,
            (plan) => emit(AddGoalDayesSuccess(plan)),);
    });
    on<NoAddGoalDayes>((event, emit) async {
      emit(AddGoalDayesLoading());
      var result =await goalsRepo.noAddday();
      result.fold((failed) =>emit(NoAddGoalDayesFailed(failed.errMassage,failed.obj)) ,
            (plan) => emit(NoAddGoalDayesSuccess(plan)),);
    });
    on<GetUserStatusEvent>((event, emit) async {
      if(event.pageNumber==0) {
        emit(UserStatusGoalLoadingFood());
      }
      else if(event.pageNumber==1) {
        emit(UserStatusGoalLoadingSleep());
      }
      else if(event.pageNumber==2) {
        emit(UserStatusGoalLoadingWater());
      }
      var result =await goalsRepo.getUserStatus();
      result.fold((failed) =>emit(UserStatusGoalFailed(failed.errMassage,failed.obj)) ,
            (plan) {
              if(event.pageNumber==0) {
                emit(UserStatusGoalSuccessFood(plan));
              }
              else if(event.pageNumber==1) {
                emit(UserStatusGoalSuccessSleep(plan));
              }
              else if(event.pageNumber==2) {
                emit(UserStatusGoalSuccessWater(plan));
              }

            },);
    });
  }
}
