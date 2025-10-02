import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/colo_extension.dart';
import '../../../../../common/common blocs/languge blocs/languge_bloc.dart';
import '../../../../../common/styles.dart';
import '../../../data/models/plans_model.dart';
import '../../views_bloc/plans bloc/plans_bloc.dart';
class MuscleDetailesText extends StatelessWidget {

  final String titleAr;
  final String titleEn;
  final int index;
  const MuscleDetailesText({super.key,  required this.index, required this.titleAr, required this.titleEn});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LangugeBloc, LangugeState>(
  builder: (_, state1) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          state1.locale== Locale('ar')?titleAr:titleEn,
          style: Styles.kFontSize14
              .copyWith(color: TColor.black),
        ),
        // Text(
        //   state1.locale== Locale('ar')? state.data![index].level!
        //       .title
        //       .toString():state.data![index].planLevels!.plan!
        //       .typeAr
        //       .toString(),
        //   style: Styles.kFontSize12
        //       .copyWith(color: TColor.gray),
        // ),
      ],
    );
  },
);
  }
}
