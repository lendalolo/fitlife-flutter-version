import 'package:flutter/material.dart';

import '../../../../../../common/colo_extension.dart';
import '../../../../../../common/styles.dart';

class CustomUnitWedgit extends StatelessWidget {
  const CustomUnitWedgit({
    super.key, required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient:TColor.kcardGradiant
        // LinearGradient(
        //   colors: TColor.secondaryG,
        // )
        ,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        text,
        style: Styles.kFontSize11,
      ),
    );
  }
}