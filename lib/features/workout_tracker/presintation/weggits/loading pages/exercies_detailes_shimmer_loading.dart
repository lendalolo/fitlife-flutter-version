import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../common/colo_extension.dart';
import '../exercies detailes wedgites/vedio_holder_wedgit.dart';

class ExerciesDetailesShimmerLoading extends StatelessWidget {
  const ExerciesDetailesShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      baseColor: TColor.primaryColor2.withOpacity(0.4),
      highlightColor: Colors.grey[100]!,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: media.width,
              height: media.width * 0.43,
             color: Colors.deepOrange,
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: 70,
              height: 30,
              color: Colors.deepOrange,
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              width: 100,
              height: 10,
              color: Colors.deepOrange,
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: 70,
              height: 30,
              color: Colors.deepOrange,
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              width: 400,
              height: 10,
              color: Colors.deepOrange,
            ),
            Container(
              width: 200,
              height: 10,
              color: Colors.deepOrange,
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: 500,
              height: 10,
              color: Colors.deepOrange,
            ),
            const SizedBox(
              height: 15,
            ),
           // ExerciesDetailesHowToDoItWidget(stepArr: eObj.steps!),
            Container(
              width: 400,
              height: 10,
              color: Colors.deepOrange,
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
