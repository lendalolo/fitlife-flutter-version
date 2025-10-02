part of 'languge_bloc.dart';

class LangugeEvent {}
class setLangugeEvent extends LangugeEvent{
  final String lang;
  setLangugeEvent(this.lang);
}
class getLangugeEvent extends LangugeEvent{}


