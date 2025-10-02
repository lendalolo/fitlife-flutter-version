import 'package:fitness/common/utls/name_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../../../../../common/api_servieses.dart';
import '../../../../../common/colo_extension.dart';
import '../../../../../common/common blocs/languge blocs/languge_bloc.dart';
import '../../../../../common/errors/lootie_image_text_empty.dart';
import '../../../../../common/localization/applocalizations.dart';
import '../../../../../common/main_tab/select_view.dart';
import '../../../../../common/servies_locator.dart';
import '../../../../../common_widget/custtom_app_title.dart';
import '../../../../../common_widget/custtom_read_more_descriptons.dart';
import '../../../../../common_widget/today_target_cell.dart';
import '../../../../food/presintation/veiwes/wedgits/popular_meal_row.dart';
import '../../../data/models/today_target_model.dart';
import '../../../data/repo/goales_repo_impl.dart';
import '../../../data/repo/plans_repo_impl.dart';
import '../../views/workout_tracker_view.dart';
import '../../views_bloc/goals bloc/goals_bloc.dart';
import '../../views_bloc/plans bloc/plans_bloc.dart';
import 'latest_activity_row.dart';
import 'muscle_detailes_text.dart';
import 'muscle_image_widget.dart';
class ActivityTrackerSuccessWedgit extends StatefulWidget {
  final TodayTargetModel state;

  ActivityTrackerSuccessWedgit({super.key, required this.state});

  @override
  State<ActivityTrackerSuccessWedgit> createState() =>
      _ActivityTrackerSuccessWedgitState();
}

class _ActivityTrackerSuccessWedgitState
    extends State<ActivityTrackerSuccessWedgit> {
  int mindex = 0;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              TColor.primaryColor2.withOpacity(0.3),
              TColor.primaryColor1.withOpacity(0.3)
            ]),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalazations.of(context)!.translate(
                        "Activity Tracker")["Today Target"] ,
                    style: TextStyle(
                        color: TColor.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: TColor.primaryG,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: MaterialButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          height: 30,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          textColor: TColor.primaryColor1,
                          minWidth: double.maxFinite,
                          elevation: 0,
                          color: Colors.transparent,
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 15,
                          )),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: TodayTargetCell(
                      icon: "assets/img/water.png",
                      value:
                      '${widget.state.data![0].water![0].water!.toString()}L',
                      title: AppLocalazations.of(context)!.translate(
                          "Activity Tracker")["Water Intake"],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TodayTargetCell(
                      icon: "assets/img/sleep_schedule.png",
                      value: '${widget.state.data![0].sleep![0].sleep} h',
                      title:AppLocalazations.of(context)!.translate(
                          "Activity Tracker")["Sleep Hours"] ,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: media.width * 0.05,
        ),
        CusttomAppTitle(title: AppLocalazations.of(context)!.translate(
            "Activity Tracker")["My Plans And Exercises"]),
        widget.state.data![0].plans!.isNotEmpty? SizedBox(
          height: media.height * .25,
          child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: widget.state.data![0].plans!.length,
              itemBuilder: (context, index) {
                return Container(
                    margin: const EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () {
                        mindex = index;
                        setState(() {});
                      },
                      child: SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MuscleImageWidget(
                              media: media,
                              imageUrl:
                              '$imageBaseUrl${widget.state.data![0].plans![index].media![0].originalUrl!.split('8000/').last}',
                              index: index,
                            ),
                            MuscleDetailesText(
                              titleAr:
                              widget.state.data![0].plans![index].titleAr!,
                              titleEn:
                              widget.state.data![0].plans![index].title!,
                              index: index,
                            ),
                          ],
                        ),
                      ),
                    ));
              }),
        ):SizedBox(),
        widget.state.data![0].plans!.isNotEmpty?  BlocBuilder<LangugeBloc, LangugeState>(
          builder: (context, lstate) {
            return CusttomReadMorDescription(
              test: lstate.locale == const Locale('ar')
                  ? widget.state.data![0].plans![mindex].descriptionAr!
                  : widget.state.data![0].plans![mindex].description!,
            );
          },
        ):Lottie.asset(
          'assets/img/sad.json',
          width: 200,
          height: 200,
          repeat: true,     // Default is true
          reverse: false,   // Play backwards
          animate: true,    // Start animation automatically
        ),
        SizedBox(
          height: 15,
        ),
        CusttomAppTitle(title:AppLocalazations.of(context)!.translate(
            "Activity Tracker")["Latest Workout"] ),
        widget.state.data![0].plans!.isNotEmpty &&widget.state.data![0].plans![mindex].exercise!.isNotEmpty?
        ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.state.data![0].plans![mindex].exercise!.length,
            itemBuilder: (context, index) {
              return Stack(children: [
                LatestActivityRow(
                  wObj: widget.state.data![0].plans![mindex].exercise![index],
                  index: index, planId: widget.state.data![0].plans![mindex].id!,
                ),
                widget.state.isChecked[mindex][index] == true
                    ? const Icon(
                  Icons.check,
                  color: TColor.primaryColor2,
                  size: 60,
                )
                    : const SizedBox()
              ]);
            }):LottieImageTextEmpty(title: 'go and do some exercises',
          onPress: () async {
        await  GoRouter.of(context).pushNamed(Names.DrawerPage,extra:
          [ MultiBlocProvider(providers:
          [BlocProvider(create: (context) =>GoalsBloc( getIt.get<GoalsRepoImpl>()
            // LastDataBaseUpdatedBloc(getIt.get<LastUpdateDatabaseRepoImpl>())
          )..add(GoalsEvent())
            ,),
            BlocProvider(create: (context) => PlansBloc(getIt.get<PlansRepoImpl>()),),
            //      BlocProvider(create: (context) =>  DrawerBloc(),),
          ],
              child:
              //MyMenuBar(page: WorkoutTrackerView(animationController: animationController,),)
              WorkoutTrackerView(animationController: animationController,)
          ),animation,scalanimation],
          );
        BlocProvider.of<PlansBloc>(context).add(GetTodatTargetEvent());
          //   BlocProvider.of<LangugeBloc>(context).add(setLangugeEvent('en'));
        },),
        SizedBox(
          height: media.width * 0.05,
        ),
        CusttomAppTitle(title:AppLocalazations.of(context)!.translate(
            "Activity Tracker")["Latest Miles"] ),
     widget.state.data![0].meals!.isNotEmpty &&widget.state.data![0].meals![0].mybasckt!.isNotEmpty
        ?ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.state.data![0].meals![0].mybasckt!.length,
            itemBuilder: (context, index) {
              return PopularMealRow(
                mObj: widget.state.data![0].meals![0].mybasckt![index], isFromTodatTarget: true,
              );
            }):LottieImageTextEmpty(title: 'go and eat something',
       onPress: () async {
              await GoRouter.of(context).pushNamed(Names.mealPlanerPage);
              BlocProvider.of<PlansBloc>(context).add(GetTodatTargetEvent());
              },),
        SizedBox(
          height: media.width * 0.1,
        ),
      ],
    );
  }
}