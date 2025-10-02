import 'package:fitness/common/common%20blocs/drawer%20cubit/drawer_bloc.dart';
import 'package:fitness/common/common%20blocs/last%20database%20update%20bloc/last_data_base_updated_bloc.dart';
import 'package:fitness/common/utls/name_class.dart';
import 'package:fitness/common_widget/Custom_app_button.dart';
import 'package:fitness/common_widget/round_button.dart';
import 'package:fitness/features/auth/data/models/register_model.dart';
import 'package:fitness/features/workout_tracker/presintation/views_bloc/add%20goal%20bloc/add_goal_dayes_or_not_bloc.dart';
import 'package:fitness/features/workout_tracker/presintation/views_bloc/add%20goal%20bloc/add_goal_dayes_or_not_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../common_widget/bottom_snackbar_message.dart';
import '../../features/workout_tracker/data/repo/goales_repo_impl.dart';
import '../../features/workout_tracker/data/repo/plans_repo_impl.dart';
import '../../features/workout_tracker/presintation/views/workout_tracker_view.dart';

import '../../features/workout_tracker/presintation/views_bloc/goals bloc/goals_bloc.dart';
import '../../features/workout_tracker/presintation/views_bloc/plans bloc/plans_bloc.dart';
import '../Shared pref helper/user_cache_helper.dart';
import '../common blocs/languge blocs/languge_bloc.dart';
import '../errors/show_goal_dialoge_messeage.dart';
import '../localization/applocalizations.dart';
import '../menu par for all pages/views/menu_par.dart';
import '../repos/last_update_database_reop_impl.dart';
import '../servies_locator.dart';

class SelectView extends StatefulWidget {
  const SelectView({super.key});

  @override
  State<SelectView> createState() => _SelectViewState();
}

late AnimationController animationController;
late Animation<double> animation;
late Animation<double> scalanimation;

class _SelectViewState extends State<SelectView> with TickerProviderStateMixin {
  @override
  initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(() {
        BlocProvider.of<DrawerBloc>(context).add(DrawerEvent());
      });
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    scalanimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    //  print('kkk');
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocListener<AddGoalDayesOrNotBloc, AddGoalDayesOrNotState>(
            listener: (context, state) {
              if (state is AddGoalDayesSuccess || state is NoAddGoalDayesSuccess) {
                bottomSnackbarMassage(context: context, message: 'Success');
              } else if (state is AddGoalDayesFailed || state is NoAddGoalDayesFailed) {
                showGoalDialogMesseage(
                  context1: context,
                  state: 'It failed. Try again',
                  ontaptry: () {
                    BlocProvider.of<AddGoalDayesOrNotBloc>(context)
                        .add(AddGoalDayes());
                    GoRouter.of(context).pop();
                  },
                  ontapcancel: () {
                    BlocProvider.of<AddGoalDayesOrNotBloc>(context)
                        .add(NoAddGoalDayes());
                    GoRouter.of(context).pop();
                  },
                );
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                getIt.get<SharedPreferences>().getString('user') == null ||
                    getIt.get<SharedPreferences>().getString('user')!.isEmpty
                    ? SizedBox(
                  width: 200,
                  child: CusttomAppButton(
                    title: AppLocalazations.of(context)!
                        .translate("LogInPage")["Sign Up"],
                    icon: Icons.person,
                    onPressed: () {
                      GoRouter.of(context).pushNamed(Names.SignUp);
                    },
                  ),
                )
                    : SizedBox(),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.,
                  children: [
                    CusttomAppButton(
                        title: AppLocalazations.of(context)!
                            .translate("SelectPage")["Workout Tracker"],
                        onPressed: () {
                          GoRouter.of(context).pushNamed(
                            Names.DrawerPage,
                            extra: [
                              MultiBlocProvider(
                                  providers: [
                                    BlocProvider(
                                      create: (context) =>
                                      GoalsBloc(
                                          getIt.get<GoalsRepoImpl>()
                                        // LastDataBaseUpdatedBloc(getIt.get<LastUpdateDatabaseRepoImpl>())
                                      )
                                        ..add(GoalsEvent()),
                                    ),
                                    BlocProvider(
                                      create: (context) =>
                                          PlansBloc(getIt.get<PlansRepoImpl>()),
                                    ),
                                    //      BlocProvider(create: (context) =>  DrawerBloc(),),
                                  ],
                                  child:
                                  //MyMenuBar(page: WorkoutTrackerView(animationController: animationController,),)
                                  WorkoutTrackerView(
                                    animationController: animationController,
                                  )),
                              animation,
                              scalanimation
                            ],
                          );
                          //   BlocProvider.of<LangugeBloc>(context).add(setLangugeEvent('en'));
                        }),
                    const SizedBox(
                      height: 15,
                    ),
                    BlocListener<AddGoalDayesOrNotBloc, AddGoalDayesOrNotState>(
                      listener: (context, state) {
                        if (state is UserStatusGoalLoadingFood) {
                          bottomSnackbarMassage(
                              context: context, message: 'Loading');
                        }
                        if (state is UserStatusGoalSuccessFood) {
                          if (state.goalday.status == "subscription") {
                            GoRouter.of(context)
                                .pushNamed(Names.mealPlanerPage);
                          } else if (state.goalday.status ==
                              "non subscription") {
                            bottomSnackbarMassage(
                                context: context,
                                message:
                                'Sign with a goal so you can see the food plan');
                          } else {
                            showGoalDialogMesseage(
                              context1: context,
                              state:
                              'Your goal is expired. Do you want to add some days?',
                              ontaptry: () {
                                BlocProvider.of<AddGoalDayesOrNotBloc>(context)
                                    .add(AddGoalDayes());
                                GoRouter.of(context).pop();
                              },
                              ontapcancel: () {
                                BlocProvider.of<AddGoalDayesOrNotBloc>(context)
                                    .add(NoAddGoalDayes());
                                GoRouter.of(context).pop();
                              },
                            );
                          }
                        }
                      },
                      child: CusttomAppButton(
                        title: AppLocalazations.of(context)!
                            .translate("SelectPage")["Meal Planner"],
                        onPressed: () =>
                            BlocProvider.of<AddGoalDayesOrNotBloc>(context)
                                .add(GetUserStatusEvent(pageNumber: 0)),
                        isActive:
                        getIt.get<SharedPreferences>().getString('user') ==
                            null ||
                            getIt
                                .get<SharedPreferences>()
                                .getString('user')!
                                .isEmpty
                            ? false
                            : true,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    BlocListener<AddGoalDayesOrNotBloc, AddGoalDayesOrNotState>(
                      listener: (context, state) {
                        if (state is UserStatusGoalLoadingSleep) {
                          bottomSnackbarMassage(
                              context: context, message: 'Loading');
                        }
                        if (state is UserStatusGoalFailed) {
                          bottomSnackbarMassage(
                              context: context, message: state.errorMessage);
                        }
                        if (state is UserStatusGoalSuccessSleep) {
                          if (state.goalday.status == "subscription") {
                            GoRouter.of(context).pushNamed(Names.sleepTracerPage);
                          } else if (state.goalday.status ==
                              "non subscription") {
                            bottomSnackbarMassage(
                                context: context,
                                message:
                                'Sign with a goal so you can see the sleep plan');
                          } else {
                            showGoalDialogMesseage(
                              context1: context,
                              state:
                              'Your goal is expired. Do you want to add some days?',
                              ontaptry: () {
                                BlocProvider.of<AddGoalDayesOrNotBloc>(context)
                                    .add(AddGoalDayes());
                                GoRouter.of(context).pop();
                              },
                              ontapcancel: () {
                                BlocProvider.of<AddGoalDayesOrNotBloc>(context)
                                    .add(NoAddGoalDayes());
                                GoRouter.of(context).pop();
                              },
                            );
                          }
                        }
                      },
                      child: CusttomAppButton(
                          title: AppLocalazations.of(context)!
                              .translate("SelectPage")["Sleep Tracker"],
                          onPressed: () =>
                              BlocProvider.of<AddGoalDayesOrNotBloc>(context)
                                  .add(GetUserStatusEvent(pageNumber: 1)),
                          isActive:
                          getIt.get<SharedPreferences>().getString('user') ==
                              null ||
                              getIt
                                  .get<SharedPreferences>()
                                  .getString('user')!
                                  .isEmpty
                              ? false
                              : true),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    BlocListener<AddGoalDayesOrNotBloc, AddGoalDayesOrNotState>(
                      listener: (context, state) {
                        if (state is UserStatusGoalLoadingWater) {
                          bottomSnackbarMassage(
                              context: context, message: 'Loading');
                        }
                        if (state is UserStatusGoalSuccessWater) {
                          if (state.goalday.status == "subscription") {
                            GoRouter.of(context).pushNamed(Names.waterPage);
                          } else if (state.goalday.status ==
                              "non subscription") {
                            bottomSnackbarMassage(
                                context: context,
                                message:
                                'Sign with a goal so you can see the water plan');
                          } else {
                            showGoalDialogMesseage(
                              context1: context,
                              state:
                              'Your goal is expired. Do you want to add some days?',
                              ontaptry: () {
                                BlocProvider.of<AddGoalDayesOrNotBloc>(context)
                                    .add(AddGoalDayes());
                                GoRouter.of(context).pop();
                              },
                              ontapcancel: () {
                                BlocProvider.of<AddGoalDayesOrNotBloc>(context)
                                    .add(NoAddGoalDayes());
                                GoRouter.of(context).pop();
                              },
                            );
                          }
                        }
                      },
                      child: CusttomAppButton(
                          title: AppLocalazations.of(context)!
                              .translate("SelectPage")["Water page"],
                          onPressed: () =>
                              BlocProvider.of<AddGoalDayesOrNotBloc>(context)
                                  .add(GetUserStatusEvent(pageNumber: 2)),
                          isActive:
                          getIt.get<SharedPreferences>().getString('user') ==
                              null ||
                              getIt
                                  .get<SharedPreferences>()
                                  .getString('user')!
                                  .isEmpty
                              ? false
                              : true),
                    ),
                  ],
                ),
                Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
