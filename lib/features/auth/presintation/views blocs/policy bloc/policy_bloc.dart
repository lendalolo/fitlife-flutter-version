import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'policy_event.dart';
part 'policy_state.dart';

class PolicyBloc extends Bloc<PolicyEvent, CheckPolicyState> {
  PolicyBloc() : super(CheckPolicyState(false)) {
    on<CheckPolicy>((event, emit) {
      emit(CheckPolicyState(!event.isPressed));
    });
  }
}
