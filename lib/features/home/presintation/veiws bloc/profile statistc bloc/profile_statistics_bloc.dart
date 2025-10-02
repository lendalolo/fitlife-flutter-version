import 'package:bloc/bloc.dart';
import 'package:fitness/features/home/data/models/profile_model.dart';
import 'package:fitness/features/home/data/repo/profile_repo.dart';


part 'profile_statistics_event.dart';
part 'profile_statistics_state.dart';

class ProfileStatisticsBloc extends Bloc<ProfileStatisticsEvent, ProfileStatisticsState> {
  final ProfileStatistics profileModel;
  ProfileStatisticsBloc(this.profileModel) : super(ProfileStatisticsInitial()) {
    on<ProfileStatisticsEvent>((event, emit) async {
      emit(ProfileStatisticsLoading());
      var result =await profileModel.fetchProfileStatistics();
      result.fold((failed) =>emit(ProfileStatisticsFailed(failed.errMassage,failed.obj)) ,
            (plan) {
          emit(ProfileStatisticsSuccess(plan));
        },);
    });
  }
}
