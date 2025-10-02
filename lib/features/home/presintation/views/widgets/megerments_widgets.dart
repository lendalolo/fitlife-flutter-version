import 'package:fitness/features/home/presintation/views/widgets/sleep_megurment_widget.dart';
import 'package:fitness/features/home/presintation/views/widgets/waterMigurmentWidget.dart';
import 'package:flutter/material.dart';
import '../../../../../common/localization/applocalizations.dart';
import '../../../data/models/profile_model.dart';
import 'calories_megerment_widget.dart';
class MegermentsWidgets extends StatelessWidget {
  final ProfileModel profileModel;
  const MegermentsWidgets({
    super.key,
    required this.media, required this.profileModel,
  });

  final Size media;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        WaterMegurmentWedgit(media: media,
          amount: "${(double.parse(profileModel.waterForDay??'0') / 15)}",
          leterTodar: profileModel.waterForDay ?? '0', maxamount: 15, ),
        SizedBox(
          width: media.width * 0.05,
        ),
        Expanded(
            child: Column(
              children: [
               SleepMegurmentWidget( sleepAmount:profileModel.sleepForDay?.toString()??"" ,),
                SizedBox(
                  height: media.width * 0.05,
                ),
                CaloriesMegermentWidget( cal:profileModel.totalRate??0,
                  text: "%${AppLocalazations.of(context)!.translate(
                      "Profile")["The Total Rate"]}",),
              ],
            ))
      ],
    );
  }
}