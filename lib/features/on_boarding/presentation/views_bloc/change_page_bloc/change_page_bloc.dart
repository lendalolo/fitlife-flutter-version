import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'change_page_event.dart';
part 'change_page_state.dart';

class ChangePageBloc extends Bloc<ChangePageEvent, ChangePage> {
  ChangePageBloc() : super(ChangePage()) {
    on<ChangePageEvent>((event, emit) {
      emit(ChangePage(index: state.index));
    });
  }
}
