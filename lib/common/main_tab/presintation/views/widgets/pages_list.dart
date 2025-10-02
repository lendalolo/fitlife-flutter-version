import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../features/clubs/app.dart';
import '../../../../../features/home/data/repo/profile_repo_impl.dart';
import '../../../../../features/home/home_view.dart';
import '../../../../../features/home/presintation/veiws bloc/profile statistc bloc/profile_statistics_bloc.dart';
import '../../../../../features/workout_tracker/data/repo/goales_repo_impl.dart';
import '../../../../../features/workout_tracker/presintation/views_bloc/add goal bloc/add_goal_dayes_or_not_bloc.dart';
import '../../../../../view/photo_progress/photo_progress_view.dart';
import '../../../../../view/profile/profile_view.dart';
import '../../../../common blocs/drawer cubit/drawer_bloc.dart';
import '../../../../servies_locator.dart';
import '../../../select_view.dart';

List<navigationButtomPages> navigationButtomPagesList =[
  navigationButtomPages("assets/img/home_tab.png", "assets/img/home_tab_select.png",  MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => DrawerBloc(),
      ),
      BlocProvider(
        create: (context) => AddGoalDayesOrNotBloc(getIt.get<GoalsRepoImpl>()),
      ),
    ],
    child: SelectView(),
  ),0),
  navigationButtomPages("assets/img/activity_tab.png","assets/img/activity_tab_select.png", BlocProvider(
  create: (context) => ProfileStatisticsBloc(getIt.get<ProfileStatisticsImpl>())..add(ProfileStatisticsEvent())
    ,
  child: HomeView(),
),1),
  navigationButtomPages("assets/img/gym no.png","assets/img/gym.png",  App(),2),
  navigationButtomPages("assets/img/profile_tab.png", "assets/img/profile_tab_select.png", const ProfileView(),3)
];

class navigationButtomPages {
  final int number;
  final String icon;
  final String activeIcon;
  final Widget page;
  navigationButtomPages(this.icon, this.activeIcon, this.page, this.number);
}
