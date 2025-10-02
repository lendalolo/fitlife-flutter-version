import 'package:dartz/dartz.dart';
import 'package:fitness/features/auth/data/models/map_mpdel.dart';
import 'package:fitness/features/auth/data/models/user_data_errorAndNoterror_model.dart';
import '../../../../common/errors/failures.dart';
import '../models/confim_register.dart';
import '../models/register_model.dart';
import '../models/user_log_out.dart';

abstract class AuthRepo
{
  Future<Either<Failure,RegisterModel>>register({required String email, required String name, required String password});
  Future<Either<Failure,RegisterModel>>logIn({required String email, required String password});
  Future<Either<Failure,UserLogOutModel>>logOut();
  Future<Either<Failure,List<PlaceModel>>>GetLocation({ required String q});
  Future<Either<Failure,ConfirmRegisterModel>>ConfirmRegister({required int code});
  Future<Either<Failure,UserDataModel>>UpdateUserInformation({required int width, required int height, required String address, required String gender, required String lat, required String lon, required String illness , required int age, required String days});
  Future<Either<Failure,UserDataModel>>AddUserInformation({required int width, required int height, required String address, required String gender, required String lat, required String lon, required String illness , required int age, required String days});
}