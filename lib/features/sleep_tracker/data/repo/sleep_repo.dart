
import 'package:dartz/dartz.dart';

import 'package:fitness/features/sleep_tracker/data/model/StoreSleepModel.dart';
import '../../../../common/errors/failures.dart';
import '../model/sleep statistics.dart';


abstract class SleepStatisticsRepo{
  Future<Either<Failure, SleepStatistics>> fetchSleepStatistics ();
  Future<Either<Failure, StoreSleepModel>> storeSleep(int h);
}