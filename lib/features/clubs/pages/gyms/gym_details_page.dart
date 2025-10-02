import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../common/colo_extension.dart';
import '../../generated/assets.dart';
import '../../global_widgets/app_image.dart';
import '../../global_widgets/app_text.dart';
import 'models/gym_model.dart';
import 'models/gyms_model.dart';

class GymDetailsPage extends StatefulWidget {
  const GymDetailsPage({super.key, required this.gymModel});

  final GymModel gymModel;

  static String get name => "GymDetailsPage";
  static String get path => "/GymDetailsPage";

  @override
  State<GymDetailsPage> createState() => _GymDetailsPageState();
}

class _GymDetailsPageState extends State<GymDetailsPage> {
  // List<GymModel> activitiesList = [
  //   GymModel(
  //     image: Assets.jpgSwimmingPool,
  //     title: "Swimming1",
  //     description: "Description1",
  //   ),
  //   GymModel(
  //     image: Assets.jpgSwimmingPool,
  //     title: "Swimming2",
  //     description: "Description2",
  //   ),
  //   GymModel(
  //     image: Assets.jpgSwimmingPool,
  //     title: "Swimming3",
  //     description: "Description3",
  //   ),
  //   GymModel(
  //     image: Assets.jpgSwimmingPool,
  //     title: "Swimming4",
  //     description: "Description4",
  //   ),
  //   GymModel(
  //     image: Assets.jpgSwimmingPool,
  //     title: "Swimming5",
  //     description: "Description5",
  //   ),
  //   GymModel(
  //     image: Assets.jpgSwimmingPool,
  //     title: "Swimming6",
  //     description: "Description6",
  //   ),
  //   GymModel(
  //     image: Assets.jpgSwimmingPool,
  //     title: "Swimming7",
  //     description: "Description7",
  //   ),
  //   GymModel(
  //     image: Assets.jpgSwimmingPool,
  //     title: "Swimming8",
  //     description: "Description8",
  //   ),
  //   GymModel(
  //     image: Assets.jpgSwimmingPool,
  //     title: "Swimming9",
  //     description: "Description9",
  //   ),
  //   GymModel(
  //     image: Assets.jpgSwimmingPool,
  //     title: "Swimming10",
  //     description: "Description10",
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      appBar: AppBar(
        title: AppText("Gyms Details", color: TColor.black),
        backgroundColor: TColor.primaryColor1.withOpacity(0.7),
      ),
      // body:
      // CustomScrollView(
      //   slivers: [
      //     SliverPadding(
      //       padding: REdgeInsets.all(16),
      //       sliver: SliverList(
      //         delegate: SliverChildListDelegate([
      //           ClipRRect(
      //             borderRadius: BorderRadius.circular(12.r),
      //             child: AppImage.asset(
      //               widget.gymModel.image,
      //               width: double.infinity,
      //               height: 200.h,
      //               fit: BoxFit.cover,
      //             ),
      //           ),
      //           16.verticalSpace,
      //           AppText.titleMedium(widget.gymModel.title, color: TColor.black),
      //           8.verticalSpace,
      //           AppText.bodyMedium(
      //             widget.gymModel.description,
      //             color: TColor.black,
      //           ),
      //           16.verticalSpace,
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               AppImage.asset(
      //                 Assets.svgDistance,
      //                 color: TColor.secondaryColor2,
      //                 width: 20.r,
      //                 height: 20.r,
      //               ),
      //               8.horizontalSpace,
      //               AppText.bodyMedium("Distance: ", color: TColor.black),
      //               AppText.bodyMedium("4 Km", color: TColor.black),
      //             ],
      //           ),
      //           8.verticalSpace,
      //           Row(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               AppImage.asset(
      //                 Assets.svgLocation,
      //                 color: TColor.secondaryColor2,
      //                 width: 20.r,
      //                 height: 20.r,
      //               ),
      //               8.horizontalSpace,
      //               Expanded(
      //                 child: AppText.bodyMedium(
      //                   "Address: Express Street , Al Forqan , Aleppo",
      //                   color: TColor.black,
      //                   maxLines: 2, // إذا بدك تحددي عدد السطور
      //                   overflow: TextOverflow.ellipsis, // إذا بدك قصّ
      //                 ),
      //               ),
      //             ],
      //           ),
      //           12.verticalSpace,
      //           AppText.titleLarge("Activities", color: TColor.secondaryColor2),
      //           12.verticalSpace,
      //         ]),
      //       ),
      //     ),
      //     SliverToBoxAdapter(
      //       child: SizedBox(
      //         height: 180.h,
      //         child: ListView.separated(
      //           scrollDirection: Axis.horizontal,
      //           itemCount: activitiesList.length,
      //           separatorBuilder: (_, __) => 8.horizontalSpace,
      //           itemBuilder: (context, index) {
      //             return SizedBox(
      //               width: 140.w,
      //               child: GymItem(
      //                 color: TColor.primaryColor1.withOpacity(0.7),
      //                 isOnTap: false,
      //                 gymModel: activitiesList[index],
      //               ),
      //             );
      //           },
      //         ),
      //       ),
      //     ),
      //     SliverToBoxAdapter(child: 24.verticalSpace),
      //   ],
      // ),
    );
  }
}

// class GymDetailsPage extends StatefulWidget {
//   const GymDetailsPage({super.key, required this.gymModel});

//   final GymModel gymModel;

//   static String get name => "GymDetailsPage";

//   static String get path => "/GymDetailsPage";

//   @override
//   State<GymDetailsPage> createState() => _GymDetailsPageState();
// }

// class _GymDetailsPageState extends State<GymDetailsPage> {
//   List<GymModel> activitiesList = [
//     GymModel(image: Assets.jpgSwimmingPool, title: "Swimming1", description: "Description1"),
//     GymModel(image: Assets.jpgSwimmingPool, title: "Swimming2", description: "Description2"),
//     GymModel(image: Assets.jpgSwimmingPool, title: "Swimming3", description: "Description3"),
//     GymModel(image: Assets.jpgSwimmingPool, title: "Swimming4", description: "Description4"),
//     GymModel(image: Assets.jpgSwimmingPool, title: "Swimming5", description: "Description5"),
//     GymModel(image: Assets.jpgSwimmingPool, title: "Swimming6", description: "Description6"),
//     GymModel(image: Assets.jpgSwimmingPool, title: "Swimming7", description: "Description7"),
//     GymModel(image: Assets.jpgSwimmingPool, title: "Swimming8", description: "Description8"),
//     GymModel(image: Assets.jpgSwimmingPool, title: "Swimming9", description: "Description9"),
//     GymModel(image: Assets.jpgSwimmingPool, title: "Swimming10", description: "Description10"),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: AppText("Gyms Details")),
//       body: SingleChildScrollView(
//         padding: REdgeInsets.all(16),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(12.r),
//               child: AppImage.asset(widget.gymModel.image, width: double.infinity, height: 200.h, fit: BoxFit.cover),
//             ),
//             16.verticalSpace,
//             AppText.titleMedium(widget.gymModel.title),
//             8.verticalSpace,
//             AppText.bodyMedium(widget.gymModel.description , color: context.colorScheme.onPrimary.withOpacity(0.6),),
//             16.verticalSpace,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 AppImage.asset(Assets.svgDistance , color:  context.colorScheme.secondary,width: 20.r,height: 20.r,),
//                 8.horizontalSpace,
//                 AppText.bodyMedium(
//                   "Distance: ",
//                 ),
//                 AppText.bodyMedium(
//                     "4 Km"
//                 ),
//               ],
//             ),
//             8.verticalSpace,
//             Wrap(
//               crossAxisAlignment: WrapCrossAlignment.center,
//               runAlignment: WrapAlignment.center,
//               children: [
//                 AppImage.asset(Assets.svgLocation , color: context.colorScheme.secondary,width: 20.r,height: 20.r,),
//                 8.horizontalSpace,
//                 AppText.bodyMedium(
//                   "Address: ",
//                 ),
//                 AppText.bodyMedium(
//                     "Express Street , Al Forqan , Aleppo"
//                 ),
//               ],
//             ),
//             12.verticalSpace,
//             AppText.titleLarge(
//                 "Activities",
//               color: context.colorScheme.secondary,
//             ),
//             SizedBox(
//               height: 180.h,
//               child: ListView.separated(
//                 scrollDirection: Axis.horizontal,
//                  shrinkWrap: true, // 🔑 هامة
//                 itemCount: 6,
//                 separatorBuilder: (_, __) => 8.horizontalSpace,
//                 itemBuilder: (context, index) {
//                   return SizedBox(
//                     width: 140.w,
//                     child: GymItem(
//                       isOnTap: false,
//                       gymModel: activitiesList.elementAt(index),
//                     ),
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
