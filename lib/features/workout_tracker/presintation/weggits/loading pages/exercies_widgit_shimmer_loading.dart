import 'package:fitness/common/colo_extension.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../common/styles.dart';
class ExerciesWidgitShimmerLoading extends StatelessWidget {
  const ExerciesWidgitShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Shimmer.fromColors(baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Exercises",
                style: Styles.kFontSize16,
              ),
              Text(
                "Sets",
                style: Styles.kFontSize12.copyWith(color: TColor.gray),
              )
            ],
          ),
          Text(
            'sets',
            style: Styles.kFontSize12.copyWith(color: TColor.black,fontWeight: FontWeight.w500),
          ),
          GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,crossAxisSpacing: 12, mainAxisSpacing: 12,),
              padding: const EdgeInsets.all(12),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      width: MediaQuery.of(context).size.width * .5,
                      height: MediaQuery.of(context).size.height * .5,
                      color: TColor.black,
                    ),
                  )
                );
              })
          ,
      ],),),
    );
  }
}
