part of 'profile_statistics_bloc.dart';

 class ProfileStatisticsState {}

class ProfileStatisticsInitial extends ProfileStatisticsState {}
class ProfileStatisticsSuccess extends ProfileStatisticsState {
 final ProfileModel allMyMeals;
 ProfileStatisticsSuccess(this.allMyMeals);
}
class ProfileStatisticsFailed extends ProfileStatisticsState {
 final String errorMessage;
 final dynamic obj;
 ProfileStatisticsFailed(this.errorMessage, this.obj);
}
class ProfileStatisticsLoading extends ProfileStatisticsState {
}
