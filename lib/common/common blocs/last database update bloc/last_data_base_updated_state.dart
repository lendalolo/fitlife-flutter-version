part of 'last_data_base_updated_bloc.dart';

class LastDataBaseUpdatedState {}

class LastDataBaseUpdatedInitial extends LastDataBaseUpdatedState {}
class LastDataBaseUpdatedFaield extends LastDataBaseUpdatedState {
   final String errorMessage;
   final dynamic obj;
   LastDataBaseUpdatedFaield(this.errorMessage, this.obj);
}
class LastDataBaseUpdatedhaveToChange extends LastDataBaseUpdatedState {}
class LastDataBaseUpdatedNoNeedToChange extends LastDataBaseUpdatedState {}
class LastDataBaseUpdatedLoading extends LastDataBaseUpdatedState {}
