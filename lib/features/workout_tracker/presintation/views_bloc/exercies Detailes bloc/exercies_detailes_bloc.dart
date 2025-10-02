import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/exercies_detailes_models.dart';
import '../../../data/repo/plans_repo.dart';

part 'exercies_detailes_event.dart';
part 'exercies_detailes_state.dart';

class ExerciesDetailesBloc extends Bloc<ExerciesDetailesEvent, ExerciesDetailesState> {
  final PlansRepo plansRepo;
  ExerciesDetailesBloc(this.plansRepo) : super(ExerciesDetailesInitial()) {
    on<ExerciesDetailesEvent>((event, emit) async {
      emit(ExerciesDetailesLoading());
      var result =await plansRepo.fetchPlansExerciesDetailes(event.exerciesId);
      result.fold((failed) =>emit(ExerciesDetailesFailed(failed.errMassage,failed.obj)) ,
            (exersisDetail) => emit(ExerciesDetailesSuccess(exersisDetail)),);
    });
  }
}
