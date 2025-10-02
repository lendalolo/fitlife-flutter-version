import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/colo_extension.dart';
import '../../../../../common/styles.dart';
import '../../../../../common_widget/drop_down_list.dart';
import '../../../../food/presintation/veiwes/meal_planner_view.dart';
import '../../../../food/presintation/veiwes/wedgits/custtom_drop_menu.dart';
import '../../views_blocs/Exersices data/exercies_data_bloc.dart';

class WorkOutProgressWdgit extends StatelessWidget {
   WorkOutProgressWdgit({
    super.key,
  });
  final TextEditingController textController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Workout Progress",
          style: Styles.kFontSize16,
        ),
        CusttomDropMenu(items: ["Weekly", "Monthly"], onChanged: (String?value ) {
          BlocProvider.of<ExerciesDataBloc>(context).add(ExerciesDataEvent(value!));
          textController.text = value;

        },),
      ],
    );
  }
}