
import 'package:dartz/dartz.dart';
import '../../../../common/errors/failures.dart';
import '../model/StoreWaterModel.dart';
import '../model/water_statistics.dart';


abstract class WaterStatisticsRepo{
  Future<Either<Failure, WaterStatistics>> fetchWaterStatistics ();
  Future<Either<Failure, StoreWater>> storeWater(double amount);
}