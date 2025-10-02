import 'package:fitness/common_widget/no_internet_no_cache_Widget.dart';
import 'package:fitness/features/workout_tracker/presintation/weggits/exercies%20widgets/plan_exercies_widget.dart';
import 'package:fitness/features/workout_tracker/presintation/weggits/workout_detailes_view_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../common/colo_extension.dart';
import '../../../../common/errors/show_error_dialoge_messeage.dart';
import '../../../../common/localization/applocalizations.dart';
import '../views_bloc/plans bloc/plans_bloc.dart';
import '../weggits/loading pages/exercies_widgit_shimmer_loading.dart';

class ExerciesOfPlans extends StatefulWidget {
  final int planId;
  final int planIdForExercies;
  const ExerciesOfPlans(
      {super.key,
      required this.planId,
    required this.planIdForExercies});

  @override
  State<ExerciesOfPlans> createState() => _ExerciesOfPlansState();
}

class _ExerciesOfPlansState extends State<ExerciesOfPlans> {
  @override
  initState() {
    super.initState();
    // BlocProvider.of<PlansBloc>(context)
    //     .add(ExerciesEvent(widget.planId, widget.weakNum, widget.dayNum));
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: TColor.kmainGradint),
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return AssetImageViewAppBar(
                media, 'assets/img/what_2.png',AppLocalazations.of(context)!.translate('ExercisesPage')[ 'Exercises']);
          },
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                color: ThemeData.light().scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  SingleChildScrollView(
                    child: BlocConsumer<PlansBloc, PlansState>(
                      listener: (context, state) {
                        if (state is ExerciesFailed) {
                          showErrorDialogMesseage(
                              context1: context, state: state.errorMessage, ontaptry:  () {
                              BlocProvider<PlansBloc>.value(
                                value: BlocProvider.of<PlansBloc>(context)
                                  ..add(ExerciesEvent(widget.planId,)),
                              );
                              GoRouter.of(context).pop();
                            }, ontapcancel: () {
                              GoRouter.of(context).pop();
                            },);
                        }
                      },
                      builder: (context, state) {
                        if (state is ExerciesSuccess) {
                          return PlanExerciesWidgit(
                            state: state.plan, planIDforExercies:widget.planIdForExercies,
                          );
                        }
                        if (state is ExerciesFailed) {
                          if (state.obj != Null) {
                            return PlanExerciesWidgit(
                              state: state.obj, planIDforExercies:widget.planIdForExercies,
                            );
                          } else {
                            return NoInternetNoCachWedgit(ontap: () {
                              BlocProvider.of<PlansBloc>(context).add(
                                  ExerciesEvent(widget.planId,));
                            });
                          }
                        }
                        return const ExerciesWidgitShimmerLoading();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
