import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/api_servieses.dart';
import '../../../../../common/common blocs/languge blocs/languge_bloc.dart';
import '../../../data/models/exercies_detailes_models.dart';
import 'step_detail_row.dart';

class ExerciesDetailesHowToDoItWidget extends StatelessWidget {
  const ExerciesDetailesHowToDoItWidget({
    super.key,
    required this.stepArr,
  });

  final List<Steps> stepArr;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: stepArr.length,
      itemBuilder: ((_, index) {
        return BlocBuilder<LangugeBloc, LangugeState>(
          builder: (context, state) {
            return StepDetailRow(
              test: state.locale == const Locale('ar') ? stepArr[index]
                  .contentAr.toString() : stepArr[index].content.toString(),
              isLast: stepArr.last == stepArr[index], index: index, ImageName:  stepArr[index].media!.isEmpty?'':'$imageBaseUrl${stepArr[index].media![0].originalUrl!.split('8000/').last}',
            );
          },
        );
      }),
    );
  }
}