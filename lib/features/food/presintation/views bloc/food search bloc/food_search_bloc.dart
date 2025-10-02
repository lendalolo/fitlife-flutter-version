import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'food_search_event.dart';
part 'food_search_state.dart';

class FoodSearchBloc extends Bloc<FoodSearchEvent, FoodSearchState> {
  FoodSearchBloc() : super(FoodSearchState('Strategie')) {
    on<FoodSearchEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
