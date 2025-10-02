import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:fitness/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/colo_extension.dart';
import '../../../../../common/common blocs/languge blocs/languge_bloc.dart';
import '../../../../../common_widget/custtom_app_image_with_gradient_backgroung.dart';
import '../../../../../common_widget/custtom_circle_dash_count_widget.dart';
import '../../../data/models/exercies_detailes_models.dart';

class StepDetailRow extends StatelessWidget {
 // final Steps sObj;
  final bool isLast;
  final int index;
final String test;
final String ImageName;
  const StepDetailRow(
      {super.key, this.isLast = false, required this.index, required this.test, required this.ImageName});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 25,
          child: Text(
            (index + 1).toString(),
            style: Styles.kFontSize14.copyWith(color: TColor.secondaryColor1),
          ),
        ),
        CusttomCircleDashItemCount(
          isLast: isLast, color: TColor.secondaryColor1, height: 50,),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CusttomAppImageWithGradentBackground(index: index, image:ImageName ,),
              // Text(
              //   (index + 1).toString(),
              //   style: Styles.kFontSize14.copyWith(color: TColor.black),
              // ),
              Text(
                test,
                style: Styles.kFontSize12.copyWith(color: TColor.gray),
              )
            ],
          ),
        )
      ],
    );
  }
}

