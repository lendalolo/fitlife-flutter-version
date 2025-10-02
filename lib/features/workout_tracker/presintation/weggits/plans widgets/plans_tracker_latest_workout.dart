// import 'package:flutter/material.dart';
//
// import '../../../../food/presintation/veiwes/wedgits/meal_category_cell.dart';
// import 'latest_activity_row.dart';
//
//
// class PlansTrackerLatestWorkout extends StatelessWidget {
//   const PlansTrackerLatestWorkout({
//     super.key,
//     required this.latestArr,
//   });
//
//   final List latestArr;
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         padding: EdgeInsets.zero,
//         physics: const NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         itemCount: latestArr.length,
//         itemBuilder: (context, index) {
//           var wObj = latestArr[index] as Map? ?? {};
//           return LatestActivityRow(wObj: wObj, index: index,);
//         });
//   }
// }