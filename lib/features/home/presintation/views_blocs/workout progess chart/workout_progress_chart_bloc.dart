import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'workout_progress_chart_event.dart';
part 'workout_progress_chart_state.dart';

class WorkoutProgressChartBloc extends Bloc<WorkoutProgressChartEvent, WorkoutProgressChartState> {
  WorkoutProgressChartBloc() : super(WorkoutProgressChartState(1)) {
    on<WorkoutProgressChartEvent>((event, emit) {
     emit(WorkoutProgressChartState(event.spotIndex));
    });
  }
}
