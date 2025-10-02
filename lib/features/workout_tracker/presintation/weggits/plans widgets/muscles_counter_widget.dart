import 'package:fitness/common/localization/applocalizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../common/colo_extension.dart';
import '../../../data/models/plans_model.dart';
import '../../views_bloc/plans bloc/plans_bloc.dart';
import '../loading pages/plans_number_shimmer_loading.dart';

class MusclesCouterWedgit extends StatefulWidget {
  const MusclesCouterWedgit({super.key});

  @override
  State<MusclesCouterWedgit> createState() => _MusclesCouterWedgitState();
}
late dynamic myPlan;
class _MusclesCouterWedgitState extends State<MusclesCouterWedgit> {
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<PlansBloc, PlansState>(
      listener: (context, state) {
        if(state is PlansSuccess) {
          myPlan = state.plan;
        }
        if(state is PlansFailed) {
          myPlan = state.obj;
        }
      },
      builder: (context, state) {
        if(state is PlansSuccess || state is PlansFailed){
          if( myPlan != Null) {
            return TextButton(
            onPressed: () {},
            child: Text(
              "${myPlan.data!.length} ${AppLocalazations.of(context)!.translate('GoalsPage')['items']}",
              style:
              TextStyle(color: TColor.gray, fontSize: 12),
            ),
          );
          }
          return Container();
        }
        return const PlansNumberShimmerLoaading();
      },
    );
  }
}
