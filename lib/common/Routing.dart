

import 'package:fitness/common/common%20blocs/drawer%20cubit/drawer_bloc.dart';
import 'package:fitness/common/servies_locator.dart';
import 'package:fitness/common/utls/name_class.dart';
import 'package:fitness/features/auth/data/models/register_model.dart';
import 'package:fitness/features/auth/presintation/views%20blocs/Auth%20bloc/auth_bloc.dart';
import 'package:fitness/features/food/presintation/views%20bloc/food%20search%20bloc/food_search_bloc.dart';
import 'package:fitness/features/home/presintation/views_blocs/Exersices%20data/exercies_data_bloc.dart';
import 'package:fitness/features/home/presintation/views_blocs/sport%20line%20chart%20bloc/sport_line_chart_bloc.dart';
import 'package:fitness/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fitness/features/on_boarding/presentation/views_bloc/opening%20app%20bloc/opining_app_bloc.dart';
import 'package:fitness/features/sleep_tracker/data/repo/sleep_repo_impl.dart';
import 'package:fitness/features/sleep_tracker/presintation/view%20blocs/counter%20sleep/sleep_counter_bloc.dart';
import 'package:fitness/features/sleep_tracker/presintation/view%20blocs/sleep_bloc.dart';
import 'package:fitness/features/water%20tracker/data/repo/water_repo_impl.dart';
import 'package:fitness/features/workout_tracker/data/models/goales_model.dart';
import 'package:fitness/test/test_page.dart';
import 'package:fitness/view/profile/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../features/auth/data/reop/register_repo_impl.dart';
import '../features/auth/presintation/views/ConfirmPassword.dart';
import '../features/auth/presintation/views/complete_profile_view.dart';
import '../features/auth/presintation/views/login_view.dart';
import '../features/auth/presintation/views/signup_view.dart';
import '../features/auth/presintation/views/welcome_view.dart';
import '../features/auth/presintation/views/what_your_goal_view.dart';
import '../features/food/data/models/all_meals.dart';
import '../features/food/data/repo/meal_repo.dart';
import '../features/food/data/repo/meal_repo_impl.dart';
import '../features/food/presintation/veiwes/food_info_details_view.dart';
import '../features/food/presintation/veiwes/meal_food_details_view.dart';
import '../features/food/presintation/veiwes/meal_schedule_view.dart';
import '../features/food/presintation/views bloc/bascket add/bascket_add_bloc.dart';
import '../features/food/presintation/views bloc/categores bloc/categories_bloc.dart';
import '../features/food/presintation/views bloc/catigory list bloc/catirgory_list_bloc.dart';
import '../features/food/presintation/views bloc/food bascket/food_pascket_bloc.dart';
import '../features/food/presintation/views bloc/meal bloc/meal_bloc.dart';
import '../features/home/activity_tracker_view.dart';
import '../features/home/data/repo/profile_repo_impl.dart';
import '../features/home/home_view.dart';
import '../features/home/presintation/veiws bloc/profile statistc bloc/profile_statistics_bloc.dart';
import '../features/on_boarding/presentation/views/started_view.dart';
import '../features/sleep_tracker/presintation/sleep_tracker_view.dart';
import '../features/water tracker/presintation/view_blocs/water couter bloc/water_counter_bloc.dart';
import '../features/water tracker/presintation/view_blocs/water_bloc.dart';
import '../features/water tracker/presintation/water_page.dart';
import '../features/workout_tracker/data/models/exercies_detailes_models.dart';
import '../features/workout_tracker/data/repo/goales_repo_impl.dart';
import '../features/workout_tracker/data/repo/plans_repo_impl.dart';
import '../features/workout_tracker/presintation/views/exercises_stpe_details.dart';
import '../features/workout_tracker/presintation/views/page/timer/bloc/timer_bloc.dart';
import '../features/workout_tracker/presintation/views/page/timer/presentation/timer_page.dart';
import '../features/workout_tracker/presintation/views/plans_tracker_view.dart';
import '../features/workout_tracker/presintation/views_bloc/add goal bloc/add_goal_dayes_or_not_bloc.dart';
import '../features/workout_tracker/presintation/views_bloc/exercies Detailes bloc/exercies_detailes_bloc.dart';
import '../features/workout_tracker/presintation/views_bloc/goals bloc/goals_bloc.dart';
import '../features/workout_tracker/presintation/views_bloc/plans bloc/plans_bloc.dart';
import '../features/workout_tracker/presintation/views_bloc/rigester in goal bloc/register_in_goal_bloc.dart';
import '../features/workout_tracker/presintation/views/exercieses_of_plans.dart';
import '../features/workout_tracker/presintation/views/plans_view.dart';
import '../features/workout_tracker/presintation/views/workout_schedule_view.dart';
import '../features/workout_tracker/presintation/views/workout_tracker_view.dart';
import '../features/food/presintation/veiwes/meal_planner_view.dart';
import 'common blocs/languge blocs/languge_bloc.dart';
import 'main_tab/presintation/views/main_tab_view.dart';
import 'main_tab/select_view.dart';

class AppRouter {
 // static  Exercise? extraExercies;
 // static int? extraindex;
  static Map<String,int>? queryParam;
  static List<dynamic>? ExercisesStepDetailsParam;
  static List<dynamic>? listExtra;
  AppRouter();
  // Route? generateRoute(RouteSettings settings){
  //   switch (settings.name){
  //     case Names.StatedPage:
  //       return MaterialPageRoute(builder: (context) =>  BlocProvider(create: (context) =>OpiningAppBloc() ,child: const StartedView(),),);
  //     case Names.startApplication:
  //       return AppRoutes().satartApplication();
  //     case Names.LogIn:
  //       return MaterialPageRoute(builder: (context) =>  const LoginView(),);
  //     case Names.OnBoardingPage:
  //       return MaterialPageRoute(builder: (context) =>  const OnBoardingView(),);
  //     case Names.CompletInformationPage:
  //       return MaterialPageRoute(builder: (context) =>   CompleteProfileView(),);
  //     case Names.SignUp:
  //       return MaterialPageRoute(builder: (context) =>  const SignUpView(),);
  //     case Names.WhatYorGoalesPage:
  //       return MaterialPageRoute(builder: (context) =>  const WhatYourGoalView(),);
  //     case Names.WelcomePage:
  //       return MaterialPageRoute(builder: (context) =>  const WelcomeView(),);
  //     case Names.MainTabPage:
  //       return MaterialPageRoute(builder: (context) =>  const MainTabView(),);
  //     case Names.SettingPage:
  //       return MaterialPageRoute(builder: (context) =>  const SettingPage(),);
  //     case Names.workOUtTracerPage:
  //       return MaterialPageRoute(builder: (context) =>  const WorkoutTrackerView(),);
  //     case Names.mealPlanerPage:
  //       return MaterialPageRoute(builder: (context) =>  const MealPlannerView(),);
  //     case Names.sleepTracerPage:
  //       return MaterialPageRoute(builder: (context) =>  const  SleepTrackerView(),);
  //
  //
  //
  //
  //
  //     // case '/detailsPage':
  //     //   final category = settings.arguments as Items;
  //     //   return MaterialPageRoute(builder: (_) =>   BlocProvider(
  //     //     create: (context) => SimelerBoxCubit(getIt.get<HomeRepoImpl>()),
  //     //     child: BookDetailsView(category: category,),
  //     //   ) );
  //
  //
  //   }
  // }
static final  generateRoute = GoRouter(

  redirect:(context, state) {
    if(state.matchedLocation == Names.startApplication)
   {
     if (getIt.get<bool>() )
     {
       return Names.OnBoardingPage;
     }
     else{
       if(getIt.get<SharedPreferences>().getString('user') == null ||
           getIt.get<SharedPreferences>().getString('user')!.isEmpty)
       {
         return Names.SelectView;
       }
       // else if(getIt.get<SharedPreferences>().getString(UserDataInformation )==null ||getIt.get<SharedPreferences>().getString(UserDataInformation)!.isEmpty){
       //   return Names.CompletInformationPage;
       // }
       else{
         return Names.MainTabPage;
       }
     }
   }
    if(state.matchedLocation==Names.MaelFoodDetaileView )
      {
        listExtra = state.extra as List<dynamic>;
      }
    if( state.matchedLocation == Names.showExercies)
      {
        //extraExercies = state.extra as Exercise?;
        // extraindex = state.extra as int;
        queryParam = state.extra as Map<String,int>;
        if(getIt.get<SharedPreferences>().getString('user') == null || getIt.get<SharedPreferences>().getString('user')!.isEmpty)
        {
          return Names.SignUp;
        }
        else{
          return Names.ExerciesOfPlans;
        }
      }
    if( state.matchedLocation == Names.DrawerPage)
      {
        listExtra = state.extra as List<dynamic>;
      }
    if(state.matchedLocation == Names.ExercisesStepDetails)
      {
        ExercisesStepDetailsParam = state.extra as List<dynamic>;
      }
    if(state.matchedLocation == Names.MealScheduleView)
    {
      ExercisesStepDetailsParam = state.extra as List<dynamic>;
    }
    if( state.matchedLocation == Names.CompletInformationPage)
    {
      listExtra = state.extra as List<dynamic>;
    }
    //
  },

    routes: [
  GoRoute(path: Names.StatedPage ,name:Names.StatedPage ,builder: (context, state) => 
      BlocProvider(create: (context) =>OpiningAppBloc(),child: const StartedView(),),),
  GoRoute(path:Names.OnBoardingPage ,name:Names.OnBoardingPage ,builder: (context, state) => const OnBoardingView(),),
  GoRoute(path: Names.LogIn ,name:Names.LogIn ,builder: (context, state) => const LoginView(),),
  GoRoute(path:Names.SignUp,name:Names.SignUp ,builder: (context, state) => const SignUpView(),),
  GoRoute(path: Names.homePage ,name:Names.homePage ,builder: (context, state) => HomeView(),),
  GoRoute(path: Names.WelcomePage,name:Names.WelcomePage ,builder: (context, state) => const WelcomeView(),),
  GoRoute(path:Names.CompletInformationPage,name:Names.CompletInformationPage ,
    builder: (context, state) =>  MultiBlocProvider(
  providers: [
    BlocProvider(create: (context) => AuthBloc(getIt.get<AuthImpl>()),),
    BlocProvider(create: (context) => ExerciesDataBloc(),),
  ],
  child: CompleteProfileView(isEditing: listExtra![0] as bool,
    registerModel: listExtra![1]==null?null:listExtra![1] as RegisterModel,),
),),
      GoRoute(path:Names.ConfirmRegisterPage,name:Names.ConfirmRegisterPage ,
        builder: (context, state) =>  MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AuthBloc(getIt.get<AuthImpl>()),),
          ],
          child: ConfirmRegisterPage(),
        ),),
      //
  GoRoute(path: Names.MainTabPage,name:Names.MainTabPage ,builder: (context, state) =>
      MultiBlocProvider(providers:[
    BlocProvider(create: (context) => SportLineChartBloc(),),
    BlocProvider(create: (context) => AuthBloc(getIt.get<AuthImpl>()),),
    BlocProvider(create: (context) => ExerciesDataBloc(),),
    BlocProvider(create: (context) => ProfileStatisticsBloc(getIt.get<ProfileStatisticsImpl>())..add(ProfileStatisticsEvent()))
    // AuthBloc
  // BlocProvider.of<ProfileStatisticsBloc>(context).add(ProfileStatisticsEvent());
  ], child: const MainTabView()),),
  GoRoute(path: Names.WhatYorGoalesPage,name:Names.WhatYorGoalesPage ,builder: (context, state) => const WhatYourGoalView(),),
  GoRoute(path: Names.mealPlanerPage,name:Names.mealPlanerPage ,builder: (context, state) =>
      MultiBlocProvider(providers:[
   BlocProvider(create: (context) => BascketAddBloc()),
    BlocProvider(create: (context) => FoodDataBloc(),),
    BlocProvider(create: (context) => FoodPascketBloc(),),
    BlocProvider(create: (context) => ExerciesDataBloc(),),
    BlocProvider(create: (context) => MealBloc(getIt.get<MealRepoImpl>())..add(GetAllMealesEvent(1, 0, 0, 0)),),
  ], child: const  MealPlannerView()),),
  GoRoute(path: Names.sleepTracerPage ,name:Names.sleepTracerPage ,builder: (context, state) => MultiBlocProvider(
  providers: [
    BlocProvider(create: (BuildContext context) =>SleepBloc(getIt.get<SleepStatisticsImpl>())..add(SleepStaticticsEvent())),
    BlocProvider(create: (BuildContext context) =>SleepCounterBloc())
  ]
  ,child:const SleepTrackerView(),),
  ),
  GoRoute(path:Names.workOUtTracerPage,name:Names.workOUtTracerPage ,builder: (context, state) =>  MultiBlocProvider(providers:
  [BlocProvider(create: (context) =>GoalsBloc( getIt.get<GoalsRepoImpl>())..add(GoalsEvent()) ,),
    BlocProvider(create: (context) =>  DrawerBloc(),),
    BlocProvider(create: (context) => AddGoalDayesOrNotBloc( getIt.get<GoalsRepoImpl>()),),

    BlocProvider(create: (context) => PlansBloc(getIt.get<PlansRepoImpl>()),)], child:WorkoutTrackerView(animationController: state.extra as AnimationController,)),
  ),
  GoRoute(path: Names.SettingPage ,name:Names.SettingPage ,builder: (context, state) => const SettingPage(),),
  GoRoute(path: Names.ActivityTrackerView ,name:Names.ActivityTrackerView ,builder: (context, state) =>MultiBlocProvider(
  providers: [
  BlocProvider(
  create: (context) => PlansBloc(getIt.get<PlansRepoImpl>())..add(GetTodatTargetEvent()),
  ),
  ],
  child:  const ActivityTrackerView(),
  ),),
  GoRoute(path: Names.WorkoutScheduleView ,name:Names.WorkoutScheduleView ,builder: (context, state) => const WorkoutScheduleView(),),
      GoRoute(path: Names.PlansTrackerView ,name:Names.PlansTrackerView ,builder: (context, state) =>  MultiBlocProvider(
  providers: [
    BlocProvider(create: (context) => ExerciesDataBloc(),),
    BlocProvider(
      create: (context) => PlansBloc(getIt.get<PlansRepoImpl>())..add(GetPlansStaticticsEvent(state.extra as int)),
    ),
  ],
  child: PlansTrackerView(PlanId: state.extra as int,),
),),

      //
  GoRoute(path: Names.ExerciesOfPlans ,name:Names.ExerciesOfPlans ,builder: (context, state) => BlocProvider(create: (context) =>
  PlansBloc(getIt.get<PlansRepoImpl>())..add(ExerciesEvent(queryParam!['planId']!))
        ,child:ExerciesOfPlans(planId:queryParam!['planId']!, planIdForExercies: queryParam!['planIdForExercies']! ,) ,),),
  GoRoute(path: Names.ExercisesStepDetails ,name:Names.ExercisesStepDetails ,builder: (context, state) =>
      MultiBlocProvider(providers: [BlocProvider(
  create: (context) => ExerciesDetailesBloc(getIt.get<PlansRepoImpl>())..add(ExerciesDetailesEvent(ExercisesStepDetailsParam![0])),),
  BlocProvider(create: (context) => PlansBloc(getIt.get<PlansRepoImpl>()),)]
  , child: ExercisesStepDetails( ExerciesId: ExercisesStepDetailsParam![0] as int, planId: ExercisesStepDetailsParam![2] as int, nmeEn: ExercisesStepDetailsParam![1] as String, nameAr: ExercisesStepDetailsParam![3] as String,),)

,),
      GoRoute(path: Names.WorkoutDetailView ,name:Names.WorkoutDetailView ,builder: (context, state) =>
          MultiBlocProvider(providers: [
            BlocProvider(create: (context) => AddGoalDayesOrNotBloc( getIt.get<GoalsRepoImpl>())..add(GetUserStatusEvent(pageNumber: 0)),),
            BlocProvider(create: (context) => RegisterInGoalBloc(getIt.get<PlansRepoImpl>()),),
            BlocProvider(create: (context) => PlansBloc(getIt.get<PlansRepoImpl>()),

          ),], child:  PlansView(
            dObj:state.extra as Data,
          ))
      ),
  GoRoute(path: Names.MaelFoodDetaileView ,name:Names.MaelFoodDetaileView ,builder: (context, state) =>
     MultiBlocProvider(providers: [
      // BlocProvider(create: (context) => LangugeBloc()),
      // BlocProvider(create: (context) => BascketAddBloc()),
       BlocProvider(create: (context) => FoodPascketBloc()),
       BlocProvider(create: (context) => CatirgoryListBloc()),
       BlocProvider(create: (context) => FoodSearchBloc()),
       BlocProvider(create: (context) => CategoriesBloc(getIt.get<MealRepoImpl>())..add(CategoriesEvent())),
       BlocProvider(create: (context) => MealBloc(getIt.get<MealRepoImpl>())..add(GetAllMealesEvent(listExtra![0] as int, listExtra![1] as int, listExtra![2] as int, listExtra![3] as int)),),
     ], child:MealFoodDetailsView(eObj:listExtra![4] as Map)
     )
  ),
      GoRoute(path: Names.MealScheduleView ,name:Names.MealScheduleView ,builder: (context, state) =>
          MultiBlocProvider(providers: [
            BlocProvider(create: (context) => LangugeBloc()),
            BlocProvider(create: (context) => MealBloc(getIt.get<MealRepoImpl>()),),
          ], child:MealScheduleView(
 planId: ExercisesStepDetailsParam![1]as int
            //, state:  ExercisesStepDetailsParam![0]as List<Meal>,
  )
          )
      ),
      GoRoute(path: Names.FoodInfoDetailsView ,name:Names.FoodInfoDetailsView ,builder: (context, state) =>
          MultiBlocProvider(providers: [
         //   BlocProvider(create: (context) => BascketAddBloc()),
            BlocProvider(create: (context) => DrawerBloc(),),
            BlocProvider(create: (context) => FoodPascketBloc()),
            BlocProvider(create: (context) => MealBloc(getIt.get<MealRepoImpl>())..add(GetMealDetailesEvent(state.extra as int)),),
          ], child:
            FoodInfoDetailsView(index: state.extra as int,))
      ),
      GoRoute(path: Names.SelectView ,name:Names.SelectView ,builder: (context, state) =>  MultiBlocProvider(
  providers: [
    BlocProvider(
  create: (context) => DrawerBloc(),
),
    BlocProvider(
      create: (context) => AddGoalDayesOrNotBloc(getIt.get<GoalsRepoImpl>()),
    ),
  ],
  child: SelectView(),
),),
      GoRoute(path: Names.DrawerPage ,name:Names.DrawerPage ,builder: (context, state) => MultiBlocProvider(
  providers: [
    BlocProvider(
  create: (context) => DrawerBloc(),
),
    BlocProvider(
      create: (context) => AuthBloc(getIt.get<AuthImpl>()),
    ),
  ],
  child: DrawerPage(listExtra![0],listExtra![1],listExtra![2]),
),),
      GoRoute(path: Names.waterPage ,name:Names.waterPage ,builder: (context, state) =>  MultiBlocProvider(
  providers: [
    BlocProvider(
        create: (context) => DrawerBloc(),
),
    BlocProvider(
      create: (context) => WaterBloc(getIt.get<WaterStatisticsImpl>())..add(WaterStaticticsEvent()),
    ),
    BlocProvider(create: (BuildContext context) =>WaterCounterBloc())
  ],
  child: WaterPage(),
),),
      GoRoute(path: Names.ExercisCounter ,name:Names.ExercisCounter ,
        builder: (context, state) =>  MultiBlocProvider(
        providers: [
  BlocProvider(
  create: (_) => TimerBloc(),
  )
  ],
        child: TimerPage(exerciesDetailes: state.extra as ExerciesDetailes,),
      ),),

]

);

//MealFoodDetailsView(eObj: fObj)
//
}

// class AppRoutes{
//  static List<AppPages> routes(){ return [
//    AppPages(name: Names.StatedPage,page: const StartedView() ),
//    AppPages(name: Names.LogIn,page: const LoginView() ),
//    AppPages(name: Names.SignUp,page: const SignUpView() ),
//    AppPages(name: Names.CompletInformationPage,page: CompleteProfileView() ),
//    AppPages(name: Names.OnBoardingPage,page: const OnBoardingView() ),
//    AppPages(name: Names.WelcomePage,page: const WelcomeView() ),
//    AppPages(name: Names.MainTabPage,page: const MainTabView() ),
//  ];}
//
//
//  MaterialPageRoute<dynamic> satartApplication() {
//
//    if (getIt.get<bool>())
//    {
//      return MaterialPageRoute(builder: (context) =>  const OnBoardingView(),);
//    }
//    else{
// //getIt.get<SharedPreferences>().getString('user') == null || getIt.get<SharedPreferences>().getString('user')!.isEmpty
//      if(getIt.get<SharedPreferences>().getString('user') == null || getIt.get<SharedPreferences>().getString('user')!.isEmpty)
//      {
//        return MaterialPageRoute(builder: (context) =>  const SignUpView(),);
//      }
//      else{
//        return MaterialPageRoute(builder: (context) =>  const MainTabView(),);
//      }
//    }
//  }
// }
