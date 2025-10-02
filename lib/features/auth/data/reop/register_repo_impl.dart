import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fitness/common/Shared%20pref%20helper/user_cache_helper.dart';
import 'package:fitness/common/errors/failures.dart';
import 'package:fitness/features/auth/data/models/confim_register.dart';
import 'package:fitness/features/auth/data/models/map_mpdel.dart';
import 'package:fitness/features/auth/data/models/user_data_errorAndNoterror_model.dart';
import 'package:fitness/features/auth/data/models/user_log_out.dart';
import 'package:fitness/features/auth/data/reop/register_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../common/api_servieses.dart';
import '../../../../common/servies_locator.dart';
import '../../../../common/utls/consts.dart';
import '../models/register_model.dart';

class AuthImpl implements AuthRepo {
  final ApiService apiService;
  AuthImpl(this.apiService);
  @override
  Future<Either<Failure, RegisterModel>> register(
      {required String email,
      required String name,
      required String password}) async {
    try {
      var data = await apiService.post (
          endPoint: 'auth/register',
          query: {'name': name, 'email': email, 'password': password}
      );
      RegisterModel userInformation = RegisterModel.fromJson(data);
      saveUserInformationInCach(userInformation);
      return Right(userInformation);
    } catch (e) {
      if (e is DioException) {
        print(e);
        return left(ServerFailure.fromDioException(e,{}));
      }
      print(e);
      return left(
        ServerFailure(
          e.toString(),{}
        ),
      );
    }
  }

   saveUserInformationInCach(RegisterModel userInformation) {
    // if(getIt.get<SharedPreferences>().getString('user') ==null)
    getIt.get<UserCacheHelper>().setUserCache(userInformation);
     RegisterModel user =  getIt.get<UserCacheHelper>().getUserCache('user')!;
     getIt.registerSingleton<RegisterModel>(user);
  }

  @override
  Future<Either<Failure, RegisterModel>> logIn({required String email, required String password})async {
    try {
      var data = await apiService.post (
          endPoint: 'auth/login',
          query: { 'email': email, 'password': password}
      );
      RegisterModel userInformation = RegisterModel.fromJson(data);
      saveUserInformationInCach(userInformation);
      print(userInformation);
      return Right(userInformation);
    } catch (e) {
      if (e is DioException) {
        print(e);
        return left(ServerFailure.fromDioException(e,{}));
      }
      print(e);
      return left(
        ServerFailure(
          e.toString(),{}
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserDataModel>> AddUserInformation({required int width, required int height, required String address, required String gender, required String lat, required String lon, required String illness, required int age, required String days}) async {
    try {
      var data = await apiService.post (
        endPoint: 'auth/update', query: {'width':width,'height':height,'address':address,'gender':gender,'lat':lat,'lon':lon,'illness':illness,'age':age,'days':days},
        token: getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token.toString(),
      );
      UserDataModel userData= UserDataModel.fromJson(data);
      RegisterModel  oldInformation = getIt.get<UserCacheHelper>().getUserCache('user');
      oldInformation.user = User.fromJson(data['data']);
      getIt.get<SharedPreferences>().setString(UserDataInformation , json.encode(userData));
      getIt.get<UserCacheHelper>().setUserCache(oldInformation);
      print(oldInformation.user!.gender!);
      return Right(userData);
    } catch (e) {
      if (e is DioException) {
        print(e);
        return left(ServerFailure.fromDioException(e,{}));
      }
      print(e);
      return left(
        ServerFailure(
            e.toString(),{}
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<PlaceModel>>> GetLocation({required String q}) async {
    try {
      var data = await apiService.OutLinkget (
        endPoint: 'https://nominatim.openstreetmap.org/search?format=json&q=$q',
      );
      List<PlaceModel> places = (data as List)
          .map((e) => PlaceModel.fromJson(e))
          .toList();

      // Optionally save first result to SharedPreferences (if you want to keep one)
      if (places.isNotEmpty) {
        getIt.get<SharedPreferences>().setString(
          LocationData,
          json.encode(places.first.toJson()), // Save the first location as a sample
        );

      }
    //  UserAddressModel locationResponse= UserAddressModel.fromJson(data);
      return Right(places);
    } catch (e) {
      if (e is DioException) {
        print(e);
        return left(ServerFailure.fromDioException(e,{}));
      }
      print(e);
      return left(
        ServerFailure(
            e.toString(),{}
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserLogOutModel>> logOut() async {
    try {
      var data = await apiService.post (
          token: getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token.toString(), endPoint: 'auth/logout', query: {}
      );
      UserLogOutModel logOutResponse= UserLogOutModel.fromJson(data);
      //getIt.get<UserCacheHelper>().deleteUserCache('user');
    //  getIt.dropScope(UserCacheHelper)<UserCacheHelper>().setUserCache(userInformation);
    await  getIt.get<SharedPreferences>().clear();
      return Right(logOutResponse);
    } catch (e) {
      if (e is DioException) {
        print(e);
        return left(ServerFailure.fromDioException(e,{}));
      }
      print(e);
      return left(
        ServerFailure(
            e.toString(),{}
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ConfirmRegisterModel>> ConfirmRegister({required int code}) async {
    try {
      var data = await apiService.post (
          token: getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token.toString(),
          endPoint: 'auth/email/verify-code', query: {"code":code}
      );
      ConfirmRegisterModel confirmRegisterModel= ConfirmRegisterModel.fromJson(data);
      return Right(confirmRegisterModel);
    } catch (e) {
      if (e is DioException) {
        print(e);
        return left(ServerFailure.fromDioException(e,{}));
      }
      print(e);
      return left(
        ServerFailure(
            e.toString(),{}
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserDataModel>> UpdateUserInformation({required int width, required int height, required String address, required String gender, required String lat, required String lon, required String illness, required int age, required String days}) async {
    try {
      var data = await apiService.post (
        endPoint: 'user/editProfileUser', query: {'width':width,'height':height,'address':address,
        'gender':gender,'lat':lat,'lon':lon,'illness':illness,'age':age,'days':days},
        token: getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token.toString(),
      );
      UserDataModel userData= UserDataModel.fromJson(data);
      RegisterModel  oldInformation = getIt.get<UserCacheHelper>().getUserCache('user');
      oldInformation.user = User.fromJson(data['data']);
      getIt.get<SharedPreferences>().setString(UserDataInformation , json.encode(userData));
      getIt.get<UserCacheHelper>().setUserCache(oldInformation);
      print(oldInformation.user!.gender!);
      return Right(userData);
    } catch (e) {
      if (e is DioException) {
        print(e);
        return left(ServerFailure.fromDioException(e,{}));
      }
      print(e);
      return left(
        ServerFailure(
            e.toString(),{}
        ),
      );
    }
  }
  }

