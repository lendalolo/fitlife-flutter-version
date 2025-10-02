import 'package:fitness/features/sleep_tracker/data/model/sleep%20statistics.dart';
import 'package:fitness/features/sleep_tracker/presintation/view%20blocs/counter%20sleep/sleep_counter_bloc.dart';
import 'package:fitness/features/sleep_tracker/presintation/view%20blocs/counter%20sleep/sleep_counter_bloc.dart';
import 'package:fitness/features/sleep_tracker/wedgit/today_sleep_wedgit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../common/colo_extension.dart';
import '../../../common/localization/applocalizations.dart';
import '../../../common/styles.dart';
import '../../../common_widget/Custom_app_button.dart';
import '../../../common_widget/custtom_bar_graph.dart';
import '../../../common_widget/round_textfield.dart';
import '../presintation/view blocs/sleep_bloc.dart';
import '../presintation/wedgits/add_amount_today_sleep.dart';
import '../presintation/sleep_tracker_view.dart';
class SleepSuccessWedgit extends StatelessWidget {
  const SleepSuccessWedgit({
    super.key,
    required this.media,
    required this.todaySleepArr,
  });

  final Size media;
  final SleepStatistics todaySleepArr;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    AppLocalazations.of(context)!.translate("sleep")["my progress"]   ,
                    style: TextStyle(
                      color: TColor.black,
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                CusttomBarGraph(x: todaySleepArr.data!.x!, y: todaySleepArr.data!.y!,
                  lengthOfTheBar:  todaySleepArr.data!.lenghtOfY.toDouble(),) ,
                // CusttomBarGraph(x: ["tt","tt","tt","tt","tt"], y: [600,800,33,800,60],
                //   lengthOfTheBar:  900,) ,
                SizedBox(
                  height: media.width * 0.05,
                ),
                TodaySleepWedgit(media: media, text: todaySleepArr.data!.targets!.isNotEmpty?'${todaySleepArr.data!.targets![0]?.sleep!??0}/${todaySleepArr.data!.sleep!}':'0',),
                SizedBox(
                  height: media.width * 0.05,
                ),
                // Container(
                //   padding: const EdgeInsets.symmetric(
                //       vertical: 15, horizontal: 15),
                //   decoration: BoxDecoration(
                //     color: TColor.primaryColor2.withOpacity(0.3),
                //     borderRadius: BorderRadius.circular(15),
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         "Daily Sleep Schedule",
                //         style: TextStyle(
                //             color: TColor.black,
                //             fontSize: 14,
                //             fontWeight: FontWeight.w700),
                //       ),
                //       SizedBox(
                //         width: 70,
                //         height: 25,
                //         child: RoundButton(
                //           title: "Check",
                //           fontSize: 12,
                //           fontWeight: FontWeight.w400,
                //           onPressed: () {
                //             Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                 builder: (context) =>
                //                     const SleepScheduleView(),
                //               ),
                //             );
                //           },
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: media.width * 0.05,
                // ),

                // AddAmountTodaySleep(
                //   sObj: todaySleepArr[0],
                // ),

                // ListView.builder(
                //     padding: EdgeInsets.zero,
                //     physics: const NeverScrollableScrollPhysics(),
                //     shrinkWrap: true,
                //     itemCount: todaySleepArr.length,
                //     itemBuilder: (context, index) {
                //       var sObj = todaySleepArr[index] as Map? ?? {};
                //       return TodaySleepScheduleRow(
                //         sObj: sObj,
                //       );
                //     }),
              ],
            ),
          ),

          BlocBuilder<SleepCounterBloc, SleepCounterState>(
  builder: (context, state) {
    return Padding(
            padding: const EdgeInsets.all(23.0),
            child: CusttomAppButton(title: AppLocalazations.of(context)!.translate("sleep")['subment my sleep houres']   , onPressed: () {
              BlocProvider.of<SleepBloc>(context).add(SleepStoreEvent(state.i));

            },),
          );
  },
)
        ],
      ),
    );
  }
}