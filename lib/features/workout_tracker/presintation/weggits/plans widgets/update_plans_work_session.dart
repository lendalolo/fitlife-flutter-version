import 'package:flutter/material.dart';

import '../../../../../common/colo_extension.dart';
import '../../../../../common/localization/applocalizations.dart';
import '../../../../home/presintation/views/widgets/calories_megerment_widget.dart';
import '../../../data/models/plans_statestics.dart';
import '../../views_bloc/plans bloc/plans_bloc.dart';

class UpdatePlansWorkSession extends StatelessWidget {
  final PlansStatesitics state;
  const UpdatePlansWorkSession({
    super.key,
    required this.media, required this.state,
  });

  final Size media;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        gradient: TColor.lineChartGradient,
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        height: media.height*.25,
        width: media.width,
        child: ListView(scrollDirection: Axis.horizontal,children: [
          CaloriesMegermentWidget( cal: state.data!.totalRate!, text: "%${AppLocalazations.of(context)!
              .translate("plans statistic")["total Rate"]}",),
              SizedBox(width: 15,),
              CaloriesMegermentWidget( cal: state.data!.totalRateDay!, text: "%${AppLocalazations.of(context)!
                  .translate("plans statistic")["daily Rate"]}",),
          SizedBox(width: 15,),
              CaloriesMegermentWidget( cal:state.data!.totalRateWeekOne!.rate!, text:"%${AppLocalazations.of(context)!
                  .translate("plans statistic")["Weakly Rate"]}" ,),
        ],)
        // GridView(
        //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200,
        //       crossAxisSpacing: 10,mainAxisSpacing: 10
        //       ,mainAxisExtent: 200),
        //   children: [
        //     CaloriesMegermentWidget(media: media, cal: state.data!.totalRate!, text: 'total Rate',),
        //     CaloriesMegermentWidget(media: media, cal: state.data!.totalRateDay!, text: 'daily Rate',),
        //     CaloriesMegermentWidget(media: media, cal:state.data!.totalRateWeekOne!.rate!, text: 'Weakly Rate',),
        //   ],
        // ),
      ),
    );
  }
}