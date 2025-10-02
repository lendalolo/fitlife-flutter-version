import 'package:fitness/common/errors/show_error_dialoge_messeage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../common/colo_extension.dart';
import '../../common/localization/applocalizations.dart';
import '../../common_widget/no_internet_no_cache_Widget.dart';
import '../workout_tracker/presintation/views_bloc/plans bloc/plans_bloc.dart';
import '../workout_tracker/presintation/weggits/plans widgets/activity_tracker_success_wedgit.dart';


class ActivityTrackerView extends StatefulWidget {
  const ActivityTrackerView({super.key});

  @override
  State<ActivityTrackerView> createState() => _ActivityTrackerViewState();
}

class _ActivityTrackerViewState extends State<ActivityTrackerView> {
  int touchedIndex = -1;

  List latestArr = [
    {
      "image": "assets/img/pic_4.png",
      "title": "Drinking 300ml Water",
      "time": "About 1 minutes ago"
    },
    {
      "image": "assets/img/pic_5.png",
      "title": "Eat Snack (Fitbar)",
      "time": "About 3 hours ago"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: TColor.lightGray,
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              "assets/img/black_btn.png",
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          AppLocalazations.of(context)!.translate(
              "Activity Tracker")["Activity Tracker"],
          style: TextStyle(
              color: TColor.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: TColor.lightGray,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                "assets/img/more_btn.png",
                width: 15,
                height: 15,
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          child: BlocConsumer<PlansBloc, PlansState>(
            listener: (context, state) {
              if (state is TodayTargetFailed) {
                showErrorDialogMesseage(
                  context1: context,
                  state: state.errorMessage,
                  ontaptry: () {
                    BlocProvider.of<PlansBloc>(context).add(GetTodatTargetEvent());GoRouter.of(context).pop();
                  },
                  ontapcancel: () {GoRouter.of(context).pop();},
                );
              }
            },
            builder: (context, state) {
              if (state is TodayTargetSuccess) {
                return ActivityTrackerSuccessWedgit(
                  state: state.targetModel,
                );
              } else if (state is TodayTargetFailed) {
                if (state.obj != Null) {
                  return ActivityTrackerSuccessWedgit(
                    state: state.obj,
                  );
                }
                return NoInternetNoCachWedgit(
                  ontap: () {
                    BlocProvider.of<PlansBloc>(context)
                        .add(GetTodatTargetEvent());
                  },
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}

