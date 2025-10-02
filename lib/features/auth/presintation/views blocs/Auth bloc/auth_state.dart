part of 'auth_bloc.dart';
 class AuthState {}
 class AuthInitial extends AuthState {
  bool isPressed =false;
 }
class SignUpInitial extends AuthState {}
class ShowPasswordState extends AuthState {
  bool isPressed;
  ShowPasswordState({required this.isPressed});
}
class SignUpLoading extends AuthState {}
class SignUpSuccess extends AuthState {
 final  RegisterModel registerModel;
 SignUpSuccess(this.registerModel);
}
class SignUpFailed extends AuthState {
   final String error;
   SignUpFailed(this.error);
}
class LogInLoading extends AuthState {}
class LogInSuccess extends AuthState {
  final  RegisterModel registerModel;
  LogInSuccess(this.registerModel);
}
class LogInFailed extends AuthState {
  final String error;
  LogInFailed(this.error);
}
class IsLogedInState extends AuthState {
   final bool stuation;
  final String message;
  IsLogedInState(this.message, this.stuation);
}

class LogOutFailed extends AuthState {
  final String error;
  LogOutFailed(this.error);
}
class LogOutLoading extends AuthState {}
class LogOutSuccess extends AuthState {
  final  UserLogOutModel logOutModel;
  LogOutSuccess(this.logOutModel);
}

class SearchingLocationFailed extends AuthState {
  final String error;
  SearchingLocationFailed(this.error);
}
class SearchingLocationLoading extends AuthState {}
class SearchingLocationSuccess extends AuthState {
  final  List<PlaceModel> locationModel;
  SearchingLocationSuccess(this.locationModel);
}

class AddUserInformationLoading extends AuthState {}
class AddUserInformationSuccess extends AuthState {
  final  UserDataModel userDataModel;
  AddUserInformationSuccess(this.userDataModel);
}
class AddUserInformationFailed extends AuthState {
  final String error;
  AddUserInformationFailed(this.error);
}
class ConfirmRegisterLoading extends AuthState {}
class ConfirmRegisterSuccess extends AuthState {
  final  ConfirmRegisterModel userDataModel;
  ConfirmRegisterSuccess(this.userDataModel);
}
class ConfirmRegisterFailed extends AuthState {
  final String error;
  ConfirmRegisterFailed(this.error);
}