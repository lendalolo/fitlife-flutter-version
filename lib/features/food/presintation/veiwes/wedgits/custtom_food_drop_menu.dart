import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/colo_extension.dart';
import '../../../../../common/styles.dart';
import '../../../../../common_widget/drop_down_list.dart';
import '../../../../home/presintation/views_blocs/Exersices data/exercies_data_bloc.dart';
class CusttomFoodDropMenu extends StatelessWidget {
  final List<String> items;

  final void Function(String?) onChanged;
  const CusttomFoodDropMenu({
    super.key, required this.items, required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        gradient: TColor.kmainGradint,
        borderRadius: BorderRadius.circular(15),
      ),
      child: BlocBuilder<FoodDataBloc, FoodDataState>(
        builder: (context, state) {
          return DropDownList(
            item: items,
            hint: Text(
              state.title,
              textAlign: TextAlign.center,
              style: Styles.kFontSize12,
            ), onChanged: onChanged,
          );
        },
      ),
    );
  }
}