import 'package:fitness/features/home/presintation/views/widgets/water_animation_progress_bar.dart';
import 'package:fitness/features/home/presintation/views/widgets/water_in_take.dart';
import 'package:flutter/material.dart';

import 'app_tracker_container.dart';

class WaterMegurmentWedgit extends StatelessWidget {
  final String amount;
  final String leterTodar;
  final double maxamount;
  const WaterMegurmentWedgit({
    super.key,
    required this.media, required this.amount, required this.leterTodar, required this.maxamount,
  });

  final Size media;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: AppTrackerContainer(
          media:  media.height * 0.50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              WaterAnimationBrogressBar(media: media, ratio:  double.parse(amount),),
              const SizedBox(
                width: 10,
              ),
              WaterInTake(media:media, amount: leterTodar, maxamount: maxamount,),
            ],
          ),
        )
    );
  }
}