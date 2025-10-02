import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/regester_in_goal_model.dart';
import '../../../data/repo/plans_repo.dart';

part 'register_in_goal_event.dart';
part 'register_in_goal_state.dart';

class RegisterInGoalBloc extends Bloc<RegisterInGoalEvent, RegisterInGoalState> {
  final PlansRepo plansRepo;
  RegisterInGoalBloc(this.plansRepo) : super(RegisterInGoalInitial()) {
    on<RegisterInGoalEvent>((event, emit) async {
      emit(GoalesSubmitLoading());
      var result =await plansRepo.submitGoal(event.goalId);
      result.fold((failed) =>emit(GoalesSubmitFailed(failed.errMassage)) ,
            (GoalesState) => emit(GoalesSubmitSuccess(GoalesState)),);
    });
  }
}
