import 'package:flutter/material.dart';

import '../../../../../common/colo_extension.dart';
import '../../../../../common/localization/applocalizations.dart';
import '../../../../../common/styles.dart';
import '../../../../home/presintation/views/widgets/custtom_app_bar_icon_wedgit.dart';
AppBar CusttomAppBarForAppBarProberty({required BuildContext context,required String title}) {
  return AppBar(
    backgroundColor: TColor.white,
    centerTitle: true,
    elevation: 0,
    leading: CusttomAppBarIconWedgir(
      ontap: () {},
      child: const Icon(Icons.arrow_back_ios_rounded),
    ),
    title: Text(
     title,
      style: Styles.kFontSize16,
    ),
    actions: [
      CusttomAppBarIconWedgir(
        ontap: () {},
        child: const Icon(Icons.more_horiz),
      ),
    ],
  );
}