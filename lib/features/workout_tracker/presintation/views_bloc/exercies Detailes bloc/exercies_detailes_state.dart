part of 'exercies_detailes_bloc.dart';

class ExerciesDetailesState {}

class ExerciesDetailesInitial extends ExerciesDetailesState {}
class ExerciesDetailesSuccess extends ExerciesDetailesState {
  final ExerciesDetailes exerciesDetailes;

  ExerciesDetailesSuccess(this.exerciesDetailes);
}
class ExerciesDetailesFailed extends ExerciesDetailesState {
  final dynamic obj;
  final String errorMessage;
  ExerciesDetailesFailed(this.errorMessage, this.obj);
}
class ExerciesDetailesLoading extends ExerciesDetailesState {
}
