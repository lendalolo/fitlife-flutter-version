import 'package:dio/dio.dart';
abstract class Failure{
  final String errMassage;
  final dynamic obj;
  Failure(this.obj, { required this.errMassage,});
}
class ServerFailure extends Failure{
  ServerFailure(String s, dynamic obj) : super(obj, errMassage: s);

factory ServerFailure.fromDioException(DioException dioException, dynamic objList)
{
switch(dioException.type){
  case DioExceptionType.connectionTimeout:
    return ServerFailure('Connection timeout with ApiServer',objList);
  case DioExceptionType.sendTimeout:
    return ServerFailure('Send timeout with ApiServer',objList);
  case DioExceptionType.receiveTimeout:
    return ServerFailure('receive timeout with ApiServer',objList);
  case DioExceptionType.badCertificate:
    return ServerFailure('bad Certificate',objList);
  case DioExceptionType.badResponse:
    return ServerFailure.fromResponse(dioException.response!.statusCode!.toString(),
        dioException.response!.data,objList);
  case DioExceptionType.cancel:
    return ServerFailure('request to api server is canceled',objList);
  case DioExceptionType.connectionError:
    return ServerFailure('there is an internt conection error',objList);
  case DioExceptionType.unknown:
    if(dioException.message!.contains('SocketException'))
   {
     return ServerFailure('no internet conection',objList);
   }
    return ServerFailure('unExpected Error ,try again',objList);
  default:
    return ServerFailure('opps there is an error',objList);
}
}
factory ServerFailure.fromResponse(String statusCode, dynamic response, dynamic objList){
  if(int.parse(statusCode) ==400||int.parse(statusCode)==401)
    {
      return ServerFailure(response['message'],objList);
    }
  else if(int.parse(statusCode)==422)
  {  //RegisterErorr error = RegisterErorr.fromJson(response);
   String error =response['message'];
    return ServerFailure( error,objList);
  }
  else if(int.parse(statusCode)==404)
    {
      return ServerFailure('your request not found, please try later!',objList);
    }
  else if(int.parse(statusCode) ==500){
    return ServerFailure('internal server error, please try later!',objList);
  } else if (int.parse(statusCode) ==403){
    return ServerFailure('open an vpn',objList);
  }else{
    print(statusCode);
    return ServerFailure('opps ther was an error, please try later!',objList);
  }
}

}
class EmptyCacheFailure extends Failure{
  EmptyCacheFailure(String message, dynamic objList) : super(objList, errMassage: message);
  // factory EmptyCacheFailure.fromDioExiption(DioException dioException,dynamic objList){
  //   switch(dioException.type){
  //     case DioExceptionType.connectionTimeout:
  //       return EmptyCacheFailure('Connection timeout with ApiServer',objList);
  //     case DioExceptionType.sendTimeout:
  //       return EmptyCacheFailure('Send timeout with ApiServer',objList);
  //     case DioExceptionType.receiveTimeout:
  //       return EmptyCacheFailure('receive timeout with ApiServer',objList);
  //     case DioExceptionType.badCertificate:
  //       return EmptyCacheFailure('bad Certificate',objList);
  //     case DioExceptionType.badResponse:
  //       return EmptyCacheFailure.fromResponse(dioException.response!.statusCode!.toString(),dioException.response!.data,objList);
  //     case DioExceptionType.cancel:
  //       return EmptyCacheFailure('request to api server is canceled',objList);
  //     case DioExceptionType.connectionError:
  //       return EmptyCacheFailure('there is an internt conection error',objList);
  //     case DioExceptionType.unknown:
  //       if(dioException.message!.contains('SocketException'))
  //       {
  //         return EmptyCacheFailure('no internet conection',objList);
  //       }
  //       return EmptyCacheFailure('unExpected Error ,try again',objList);
  //     default:
  //       return EmptyCacheFailure('opps there is an error',objList);
  //   }
  // }
  // factory EmptyCacheFailure.fromResponse(String statusCode, dynamic response, dynamic objList){
  //   if(int.parse(statusCode) ==400||int.parse(statusCode)==401)
  //   {
  //     return EmptyCacheFailure(response['message'],objList);
  //   }
  //   else if(int.parse(statusCode)==422)
  //   {  //RegisterErorr error = RegisterErorr.fromJson(response);
  //     String error =response['message'];
  //     return EmptyCacheFailure( error,objList);
  //   }
  //   else if(int.parse(statusCode)==404)
  //   {
  //     return EmptyCacheFailure('your request not found, please try later!',objList);
  //   }
  //   else if(int.parse(statusCode) ==500){
  //     return EmptyCacheFailure('internal server error, please try later!',objList);
  //   } else if (int.parse(statusCode) ==403){
  //     return EmptyCacheFailure('open an vpn',objList);
  //   }else{
  //     print(statusCode);
  //     return EmptyCacheFailure('opps ther was an error, please try later!',objList);
  //   }
  // }
}
class OffLineFailure extends Failure{
  OffLineFailure(String message) : super(null, errMassage: message);
}