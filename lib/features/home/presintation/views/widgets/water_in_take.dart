import 'package:fitness/features/home/presintation/views/widgets/water_real_time_update.dart';
import 'package:flutter/material.dart';

import '../../../../../common/colo_extension.dart';
import '../../../../../common/localization/applocalizations.dart';
import '../../../../../common/styles.dart';
import 'app_tracker_container_title.dart';
class WaterInTake extends StatelessWidget {
  final Size media ;
  final String amount;
  final double maxamount;
  const WaterInTake({super.key, required this.media, required this.amount, required this.maxamount});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTrackerContainerTitle(title:AppLocalazations.of(context)!.translate("Profile")["Water Intake1"] ,
              gradiantText: "${AppLocalazations.of(context)!.translate("Profile")["Liters"]}$amount"
              ,),
            const SizedBox(
              height: 10,
            ),
            // Text(
            //   "Real time updates",
            //   style: Styles.kFontSize12.copyWith(color: TColor.gray),
            // ),
            const SizedBox(
              height: 40,
            ),
            WaterRealTimeUpdate(media: media, totalMl: maxamount,)
          ],
        ));
  }
}
