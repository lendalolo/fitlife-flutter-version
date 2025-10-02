import 'package:flutter/material.dart';

import '../../../../../../common/colo_extension.dart';
import '../../../../../../common/styles.dart';

class DayCusttomWedgit extends StatelessWidget {
  const DayCusttomWedgit({
    super.key, required this.text, required this.check,
  });
  final String text;
  final bool check;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: TColor.kcardGradiant,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Text(
            text,
            style: Styles.kFontSize11,
          ),
        check?  Icon(Icons.check,color: TColor.white,size: 40,):SizedBox()
        ]
      ),
    );
  }
}