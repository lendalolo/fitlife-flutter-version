import 'package:bloc/bloc.dart';
import 'package:fitness/features/auth/data/models/confim_register.dart';
import 'package:fitness/features/auth/data/models/map_mpdel.dart';
import 'package:fitness/features/auth/data/models/user_log_out.dart';
import 'package:flutter/cupertino.dart';



import '../../../data/models/register_model.dart';
import '../../../data/models/user_data_errorAndNoterror_model.dart';
import '../../../data/reop/register_repo.dart';


part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;
  AuthBloc(this.authRepo) : super(AuthInitial()) {
    on<Register>((event, emit)async {
      emit(SignUpLoading());
      var result = await authRepo.register(email: event.email, name: event.name, password: event.password);
      result.fold((failure) => emit(SignUpFailed(failure.errMassage)),
              (user) {
            emit(SignUpSuccess(user));
          });
    });
    on<LogIn>((event, emit)async {
      emit(LogInLoading());
      var result = await authRepo.logIn(email:event.email,password: event.password);
      result.fold((failure) => emit(LogInFailed(failure.errMassage)),
              (user) {
            emit(LogInSuccess(user));
          });
    });
    on<LogOut>((event, emit)async {
      emit(LogOutLoading());
      var result = await authRepo.logOut();
      result.fold((failure) => emit(LogOutFailed(failure.errMassage)),
              (user) {
            emit(LogOutSuccess(user));
          });
    });
    on<AddUserInformation>((event, emit)async {
      emit(AddUserInformationLoading());
      var result = await authRepo.AddUserInformation(width: event.width, height: event.height, address: event.address, gender: event.gender, lat: event.lat, lon: event.lon, illness: event.illness, age: event.age, days: event.dayes);
      result.fold((failure) => emit(AddUserInformationFailed(failure.errMassage)),
              (user) {
            emit(AddUserInformationSuccess(user));
          });
    });
    on<UpadteUserInformation>((event, emit)async {
      emit(AddUserInformationLoading());
      var result = await authRepo.UpdateUserInformation(width: event.width, height: event.height, address: event.address, gender: event.gender, lat: event.lat, lon: event.lon, illness: event.illness, age: event.age, days: event.dayes);
      result.fold((failure) => emit(AddUserInformationFailed(failure.errMassage)),
              (user) {
            emit(AddUserInformationSuccess(user));
          });
    });
    on<ConfirmRegisterEvent>((event, emit)async {
      emit(ConfirmRegisterLoading());
      var result = await authRepo.ConfirmRegister(code: event.code);
      result.fold((failure) => emit(ConfirmRegisterFailed(failure.errMassage)),
              (user) {
            emit(ConfirmRegisterSuccess(user));
          });
    });
    on<SearchLocation>((event, emit)async {
      emit(SearchingLocationLoading());
      var result = await authRepo.GetLocation(q: event.q);
      print(';;');
      result.fold((failure) => emit(SearchingLocationFailed(failure.errMassage)),
              (user) {
            emit(SearchingLocationSuccess(user));
          });
    });
  }
}
bool isp = false;
class showBloc extends Bloc<AuthEvent, ShowPasswordState> {
  showBloc() : super(ShowPasswordState(isPressed: false)) {
    on<ShowPassword>((event, emit) {
      isp ==false?isp =true: isp =false;
      emit(ShowPasswordState(isPressed: isp));
    });
  }
}
class IsLogedInBloc extends Bloc<AuthEvent, IsLogedInState> {
  IsLogedInBloc() : super(IsLogedInState('View App', false)) {
    on<IsLoged>((event, emit) {
      if(event.controlers[0].text.isEmpty && event.controlers[1].text.isEmpty )
        {
          emit(IsLogedInState('View App', false));
        } else{
        emit(IsLogedInState('Login', true));
      }
      // List<bool> list=[];
      // event.controlers.map((e) => e.addListener(() {e.text.isEmpty? list.add(true):list.add(false);}));
      // int index =0;
      // for(int i =0 ;i<event.controlers.length ;i++) {
      //   if(list[i])
      //     {
      //       index++;
      //     }
      //   if(index ==2) {
      //
      //   } else {
      //
      //   }

      // if(event.isloged == false) {
      //   emit(IsLogedInState('View App', false));
      // } else{
      //   emit(IsLogedInState('Login', true));
      // }
    //  }
    });
    on<IsSign>((event, emit) {
      if(event.isloged == false) {
        emit(IsLogedInState('View App', false));
      } else{
        emit(IsLogedInState('Register', true));
      }
    });
    // on<IsLogedNavigate>((event, emit) {
    //   if(event.isloged == false) {
    //     emit(IsLogedInState('View App', false));
    //   }
    // });
  }
}
