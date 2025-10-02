import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/colo_extension.dart';
import '../../../../../common/localization/applocalizations.dart';
import '../../../../../common/styles.dart';
import '../../../../../common/utls/name_class.dart';
import '../../../../home/presintation/views/widgets/today_target_widget.dart';
import '../../../../../common_widget/app_body_topper_dash.dart';
import 'goales_builder.dart';

class WorkoutTrackerBody extends StatelessWidget {
  const WorkoutTrackerBody({
    super.key,
    required this.media,
  });

  final Size media;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient:  LinearGradient(colors: TColor.primaryG)
      ),child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color:ThemeData.light().scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50))),
      child:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5,),
            const AppBodyTopperDash(),
            SizedBox(
              height: media.width * 0.05,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              AppLocalazations.of(context)!.translate("GoalsPage")[" What Do You Want to Train ?"],
              style: Styles.kFontSize16,
            ),
            const SizedBox(
              height: 5,
            ),
            const  GoalesBulider(),
            SizedBox(
              height: media.width * 0.1,
            ),
          ],
        ),
      ),
    ),);
  }
}

