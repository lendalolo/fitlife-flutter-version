import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'exercies_data_event.dart';
part 'exercies_data_state.dart';

class ExerciesDataBloc extends Bloc<ExerciesDataEvent, ExerciesDataState> {
  ExerciesDataBloc() : super(ExerciesDataState('weekly')) {
    on<ExerciesDataEvent>((event, emit) {
      emit(ExerciesDataState(event.title));
    });
  }
}


class FoodDataBloc extends Bloc<FoodDataEvent, FoodDataState> {
  FoodDataBloc() : super(FoodDataState('BreakFast')) {
    on<FoodDataEvent>((event, emit) {
      emit(FoodDataState(event.title));
    });
  }
}
