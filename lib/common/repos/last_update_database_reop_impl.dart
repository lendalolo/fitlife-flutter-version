// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:fitness/common/errors/failures.dart';
// import 'package:fitness/common/network_info.dart';
// import '../api_servieses.dart';
// import '../data sourses/locale_date_datasourse.dart';
// import '../data sourses/remote_date_datasourse.dart';
// import '../errors/exiptions.dart';
// import '../models/date_model.dart';
// import 'LastUpdateDatabaseRepo.dart';
//
// class LastUpdateDatabaseRepoImpl extends LastUpdateDatabaseRepo{
//   final ApiService apiService;
//   final RemoteDateDatasourse remoteDateDatasourse;
//   final LocalDateDataSourse localDateDataSourse;
//   final NetworkInfo networkInfo;
//   LastUpdateDatabaseRepoImpl(
//       {required this.apiService,
//       required this.remoteDateDatasourse,
//       required this.localDateDataSourse,
//       required this.networkInfo});
//   @override
//   Future<Either<Failure, String>> getLastTimeUpdated() async {
//     if(await networkInfo.internetConnection)
//     {
//       try{
//   LastTImeDataBaseUbdate date = await remoteDateDatasourse.getLastTimeUpdated();
//   localDateDataSourse.cashLastTimeUpdated(date);
//   return Right(date.lastTime!);
//    }
//    catch(e) {
//      if (e is DioException) {
//        print(e);
//        try{
//          final cacheddate = localDateDataSourse.fetchLastTimeUpdated();
//          localDateDataSourse.cashLastTimeUpdated(cacheddate);
//          return left(ServerFailure.fromDioException(e,cacheddate));
//        }on EmptyCacheException{
//          return left(EmptyCacheFailure('No Data is Cached and there is ${ServerFailure.fromDioException(e,Null)}',Null));
//        }
//      }
//      print(e);
//      return left(
//        ServerFailure(
//            e.toString(),localDateDataSourse.fetchLastTimeUpdated()
//        ),
//      );
//    }
//     }
//     else{
//       try{
//         final cacheddate = localDateDataSourse.fetchLastTimeUpdated();
//         return Right(cacheddate.lastTime!);
//       }on EmptyCacheException{
//         return left(EmptyCacheFailure('No Data is Cached',Null));
//       }
//     }
//   }
//
// }