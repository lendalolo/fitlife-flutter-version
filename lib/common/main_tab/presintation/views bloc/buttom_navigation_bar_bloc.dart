import 'package:bloc/bloc.dart';

part 'buttom_navigation_bar_event.dart';
part 'buttom_navigation_bar_state.dart';

class ButtomNavigationBarBloc extends Bloc<ButtomNavigationBarEvent, ButtomNavigationBarState> {
  ButtomNavigationBarBloc() : super(ButtomNavigationBarState(0)) {
    on<ButtomNavigationBarEvent>((event, emit) {
     emit(ButtomNavigationBarState(event.pageIndex));
    });
  }
}
