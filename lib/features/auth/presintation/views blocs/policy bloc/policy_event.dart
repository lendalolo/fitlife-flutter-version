part of 'policy_bloc.dart';

@immutable
 class PolicyEvent {}
class CheckPolicy extends PolicyEvent{
 bool isPressed ;
 CheckPolicy(this.isPressed);
}
