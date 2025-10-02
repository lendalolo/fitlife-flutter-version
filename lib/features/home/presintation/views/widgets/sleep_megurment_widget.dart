import 'package:fitness/common/styles.dart';
import 'package:flutter/material.dart';

import '../../../../../common/localization/applocalizations.dart';
import 'app_tracker_container.dart';
import 'app_tracker_container_title.dart';

class SleepMegurmentWidget extends StatelessWidget {
  final String sleepAmount;
  const SleepMegurmentWidget({
    super.key,
    required this.sleepAmount,
  });



  @override
  Widget build(BuildContext context) {
    Size media =MediaQuery.of(context).size;
    return AppTrackerContainer(media: media.width * 0.5,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalazations.of(context)!.translate(
                  "Profile")["Sleep"],style: Styles.kFontSize14,),
               AppTrackerContainerTitle(title:AppLocalazations.of(context)!.translate(
                   "Profile")["Sleep"] , gradiantText: "${sleepAmount??""}h"),
              const Spacer(),
              Image.asset("assets/img/sleep_grap.png",
                  width: double.maxFinite,
                  fit: BoxFit.fitWidth)
            ]));
  }
}