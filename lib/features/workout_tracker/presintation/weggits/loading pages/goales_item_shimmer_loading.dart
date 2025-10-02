import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/features/workout_tracker/presintation/weggits/goals%20widgets/what_train_row.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../common/styles.dart';
import '../../../../../common_widget/round_button.dart';

class GoalesItemShimmerLoading extends StatelessWidget {
  const GoalesItemShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Shimmer.fromColors(
              baseColor: TColor.primaryColor2.withOpacity(0.4),
              highlightColor: Colors.grey[100]!,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: BoxDecoration(
                    gradient: TColor.lineChartGradient,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                          color: Colors.black54,
                          blurRadius: 2.0,
                          blurStyle: BlurStyle.outer)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 8,
                            width: 150,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Container(
                            color: Colors.black,
                            width: 100,
                            height: 4,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RoundButton(
                              height: 30,
                              minWidth: 100,
                              title: "View Plans",
                              fontSize: 10,
                              elevation: 0.05,
                              fontWeight: FontWeight.w400,
                              onPressed: () {})
                        ],
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.54),
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            height: 90,
                            width: 90,
                            color: TColor.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ));
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 10,
          );
        });
  }
}
