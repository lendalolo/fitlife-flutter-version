import 'package:bloc/bloc.dart';


part 'sport_line_chart_event.dart';
part 'sport_line_chart_state.dart';

class SportLineChartBloc extends Bloc<SportLineChartEvent, SportLineChartState> {
  SportLineChartBloc() : super(SportLineChartInitial()) {
    on<SportLineChartEvent>((event, emit) {
      emit(SportLineChartState(event.spotIndex));
    });
    on<ExcerciesProgressChartEvent>((event, emit) {
      emit(SportLineChartState(event.spotIndex));
    });
    on<FoodProgressChartEvent>((event, emit) {
      emit(SportLineChartState(event.spotIndex));
    });
  }
}
