import 'package:flutter/material.dart';

import '../../../../../common/colo_extension.dart';
import '../../../../../common/localization/applocalizations.dart';
import '../../../../../common/styles.dart';
import '../../../../workout_tracker/presintation/views/workout_tracker_view.dart';
import 'custtom_app_bar_icon_wedgit.dart';

class CusttomAppBar extends StatelessWidget {
  final String title;
  final VoidCallback? menuOnTap;
  const CusttomAppBar({
    super.key, required this.title, this.menuOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(gradient:  LinearGradient(colors: TColor.primaryG)),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.maxFinite,
      ),
      centerTitle: true,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child:  CusttomAppBarIconWedgir(ontap: (){Navigator.pop(context);}, child:const Icon(
          Icons.arrow_back_ios_rounded,
          size: 15,
        ) ),
      ),
      title: Text(
        title,
        style: Styles.kFontSize16.copyWith(color: TColor.white),
      ),
      actions: [
        CusttomAppBarIconWedgir(
          ontap: menuOnTap??(){},
          child: const Icon(Icons.more_horiz,size: 15,),
        )
      ],
    );
  }
}