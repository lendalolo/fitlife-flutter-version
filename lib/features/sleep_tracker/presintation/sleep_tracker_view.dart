
import 'package:fitness/common/styles.dart';
import 'package:fitness/common_widget/Loading_page.dart';
import 'package:fitness/features/food/presintation/veiwes/wedgits/app_bar_for_app_bar_property.dart';
import 'package:fitness/features/sleep_tracker/presintation/view%20blocs/sleep_bloc.dart';
import 'package:fitness/features/sleep_tracker/presintation/wedgits/add_amount_today_sleep.dart';
import 'package:fitness/features/sleep_tracker/sleep_schedule_view.dart';
import 'package:fitness/features/sleep_tracker/wedgit/sleep_success_wedgit.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../common/colo_extension.dart';
import '../../../common/errors/show_error_dialoge_messeage.dart';
import '../../../common/localization/applocalizations.dart';
import '../../../common_widget/bottom_snackbar_message.dart';
import '../../../common_widget/custtom_bar_graph.dart';
import '../../../common_widget/no_internet_no_cache_Widget.dart';
import '../../../common_widget/round_button.dart';
import '../../../common_widget/round_textfield.dart';
import '../../../common_widget/today_sleep_schedule_row.dart';
import '../../../common_widget/custom_text_feild_prefix_icon.dart';

class SleepTrackerView extends StatefulWidget {
  const SleepTrackerView({super.key});

  @override
  State<SleepTrackerView> createState() => _SleepTrackerViewState();
}

class _SleepTrackerViewState extends State<SleepTrackerView> {
  List todaySleepArr = [
    {
      "name": "Bedtime",
      "image": "assets/img/bed.png",
      "time": "01/06/2023 09:00 PM",
      "duration": "in 6hours 22minutes"
    },
    {
      "name": "Alarm",
      "image": "assets/img/alaarm.png",
      "time": "02/06/2023 05:10 AM",
      "duration": "in 14hours 30minutes"
    },
  ];

  List findEatArr = [
    {
      "name": "Breakfast",
      "image": "assets/img/m_3.png",
      "number": "120+ Foods"
    },
    {"name": "Lunch", "image": "assets/img/m_4.png", "number": "130+ Foods"},
  ];

  List<int> showingTooltipOnSpots = [4];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar:CusttomAppBarForAppBarProberty(context: context, title: AppLocalazations.of(context)!.translate("sleep")["Sleep Tracker"] ),
      body: BlocConsumer<SleepBloc, SleepState>(
        listener: (context, state) {
          if(state is SleepStoreSuccess){
            BlocProvider.of<SleepBloc>(context).add(SleepStaticticsEvent());
            bottomSnackbarMassage(context: context, message: state.sleep.message!);
          }
          if (state is SleepFailed) {
            showErrorDialogMesseage(
              context1: context,
              state: state.errorMessage,
              ontaptry: () {
                BlocProvider.of<SleepBloc>(context).add(SleepStaticticsEvent());GoRouter.of(context).pop();
              },
              ontapcancel: () {GoRouter.of(context).pop();},
            );
          }
        },
        builder: (context, state) {
          if(state is SleepFailed)
          {
            if (state.obj != Null) {
              return SleepSuccessWedgit(media: media, todaySleepArr: state.obj);
            }
            return NoInternetNoCachWedgit(
              ontap: () {
                BlocProvider.of<SleepBloc>(context)
                    .add(SleepStaticticsEvent());
              },
            );
          }
          else if(state is SleepStatisticsSuccess)
          {
            return SleepSuccessWedgit(media: media, todaySleepArr: state.sleep);
          }
          return Center(child: LoadingPage());
        },
      ),
    );
  }


}



