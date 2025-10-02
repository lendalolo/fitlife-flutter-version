
import 'package:fitness/features/home/presintation/veiws%20bloc/profile%20statistc%20bloc/profile_statistics_bloc.dart';
import 'package:fitness/features/home/presintation/views/widgets/profile_statistics_success_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../common/errors/show_error_dialoge_messeage.dart';
import '../../common_widget/no_internet_no_cache_Widget.dart';


class HomeView extends StatelessWidget {
  final List lastWorkoutArr = [
    {
      "name": "Full Body Workout",
      "image": "assets/img/Workout1.png",
      "kcal": "180",
      "time": "20",
      "progress": 0.3
    },
    {
      "name": "Lower Body Workout",
      "image": "assets/img/Workout2.png",
      "kcal": "200",
      "time": "30",
      "progress": 0.4
    },
    {
      "name": "Ab Workout",
      "image": "assets/img/Workout3.png",
      "kcal": "300",
      "time": "40",
      "progress": 0.7
    },
  ];

  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: BlocConsumer<ProfileStatisticsBloc, ProfileStatisticsState>(
              listener: (context, state) {
                if (state is ProfileStatisticsFailed) {
                  showErrorDialogMesseage(
                    context1: context,
                    state: state.errorMessage,
                    ontaptry: () {
                      BlocProvider.of<ProfileStatisticsBloc>(context).add(ProfileStatisticsEvent());GoRouter.of(context).pop();
                    },
                    ontapcancel: () {GoRouter.of(context).pop();},
                  );
                }
              },
              builder: (context, state) {
                if(state is ProfileStatisticsFailed)
                  {
                    if (state.obj != Null) {
                      return ProfileStatisticsSuccessBody(
                          media: media, dataStateList: state.obj);
                    }
                    return NoInternetNoCachWedgit(
                      ontap: () {
                        BlocProvider.of<ProfileStatisticsBloc>(context)
                            .add(ProfileStatisticsEvent());
                      },
                    );
                  }
                else if(state is ProfileStatisticsSuccess)
                  {
                    return ProfileStatisticsSuccessBody(
                        media: media, dataStateList: state.allMyMeals);
                  }
               return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ),
    );
  }
}



