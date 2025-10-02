
import 'package:dartz/dartz.dart';
import 'package:fitness/features/home/data/models/profile_model.dart';
import '../../../../common/errors/failures.dart';


abstract class ProfileStatistics{
  Future<Either<Failure, ProfileModel>> fetchProfileStatistics ();
}