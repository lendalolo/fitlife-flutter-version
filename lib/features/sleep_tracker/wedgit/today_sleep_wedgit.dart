import 'package:fitness/common/styles.dart';
import 'package:fitness/common_widget/Custom_app_button.dart';
import 'package:fitness/common_widget/custtom_app_title.dart';
import 'package:fitness/features/sleep_tracker/presintation/view%20blocs/counter%20sleep/sleep_counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../common/colo_extension.dart';
import '../../../common/localization/applocalizations.dart';

class TodaySleepWedgit extends StatelessWidget {
  final String text;
  const TodaySleepWedgit({
    super.key,
    required this.media,
    required this.text,
  });

  final Size media;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: media.height * 0.7,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: TColor.primaryG),
          borderRadius: BorderRadius.circular(20)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            AppLocalazations.of(context)!
                .translate("sleep")["Last Night Sleep"],
            style: TextStyle(
              color: TColor.white,
              fontSize: 24,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            "$text h",
            style: TextStyle(
                color: TColor.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        //const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/img/sleep2.json',
                fit: BoxFit.fitHeight, height: 300, width: 300),
          ],
        ),
        Image.asset(
          "assets/img/SleepGraph.png",
          width: double.maxFinite,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                BlocProvider.of<SleepCounterBloc>(context)
                    .add(SleepCounterEventDecrement());
              },
              icon: Icon(
                Icons.arrow_circle_right_outlined,
                size: 60,
                color: TColor.white,
              ),
            ),
            BlocBuilder<SleepCounterBloc, SleepCounterState>(
              builder: (context, state) {
                return Container(
                  alignment: AlignmentDirectional.center,
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: TColor.white,
                      borderRadius: BorderRadius.circular(900)),
                  child: Center(
                      child: Text(
                    '${state.i} h',
                    style: Styles.kFontSize24,
                  )),
                );
              },
            ),
            IconButton(
              onPressed: () {
                BlocProvider.of<SleepCounterBloc>(context)
                    .add(SleepCounterEventIncrement());
              },
              icon: Icon(
                Icons.arrow_circle_left_outlined,
                size: 60,
                color: TColor.white,
              ),
            ),

          ],
        ),

      ]),
    );
  }
}
