import 'package:bloc/bloc.dart';
import 'package:fitness/features/food/data/models/all_meals.dart';
part 'catirgory_list_event.dart';
part 'catirgory_list_state.dart';

class CatirgoryListBloc extends Bloc<CatListEvints, CatirgoryListState> {
  List<Meal> myList=[];
  CatirgoryListBloc() : super(CatirgoryListInitial()) {
    on<CatirgoryListEvent>((event, emit) {
      final filteredList = event.sortedList
          .where((meal) => meal.categoryId == event.catId)
          .toList();

      emit(CatirgoryListchanged(filteredList));
      // myList.clear();
      // for (var element in event.sortedList) {
      //   if(event.catId == element.categoryId!) {
      //     myList.add(element);
      //     print(myList);
      //   }
      //   print('object');
      // }
      // emit(CatirgoryListchanged(List.from(myList)));
    });

    on<CatirgoryRestListEvent>((event, emit) {
      emit(CatirgoryListInitial());
    });
  }

}
