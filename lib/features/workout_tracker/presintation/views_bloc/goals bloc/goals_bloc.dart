import 'dart:async';

import 'package:bloc/bloc.dart';
import '../../../../../common/common blocs/last database update bloc/last_data_base_updated_bloc.dart';
import '../../../data/models/goales_model.dart';
import '../../../data/repo/goales_repo.dart';
part 'goals_event.dart';
part 'goals_state.dart';

class GoalsBloc extends Bloc<GoalsEvent, GoalsState> {
  final GoalsRepo goalsRepo;
 // final LastDataBaseUpdatedBloc lastDataBaseUpdatedBloc;
  late StreamSubscription streamSubscription ;
  GoalsBloc( this.goalsRepo) : super(GoalsInitial()) {
    on<GoalsEvent>((event, emit) async{
            emit(GoalsLoading());
            var result =await goalsRepo.fetchGoals();
            result.fold((failed) =>emit(GoalsFailed(failed.errMassage,failed.obj)) ,
                  (plan) => emit(GoalsSuccess(plan)),);
      // streamSubscription = lastDataBaseUpdatedBloc.stream.listen((state) async {
      //   if(state is LastDataBaseUpdatedNoNeedToChange ||state is LastDataBaseUpdatedFaield ){
      //     emit(GoalsLoading());
      //     var result = goalsRepo.fetchGoalsFromCashe();
      //     result.fold((failed) =>emit(GoalsFailed(failed.errMassage,failed.obj)) ,
      //           (plan) => emit(GoalsSuccess(plan)),);
      //   }
      //   else if(state is LastDataBaseUpdatedhaveToChange)
      //     {
      //       emit(GoalsLoading());
      //       var result =await goalsRepo.fetchGoals();
      //       result.fold((failed) =>emit(GoalsFailed(failed.errMassage,failed.obj)) ,
      //             (plan) => emit(GoalsSuccess(plan)),);
      //     }
      // });
    });
  }
}
