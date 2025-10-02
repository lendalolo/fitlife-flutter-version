import 'package:dartz/dartz.dart';
import 'package:fitness/common/errors/failures.dart';

abstract class LastUpdateDatabaseRepo{
  Future<Either<Failure,String>> getLastTimeUpdated();
}