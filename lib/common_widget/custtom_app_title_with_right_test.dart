import 'package:flutter/material.dart';

import '../common/colo_extension.dart';
import 'custtom_app_title.dart';

class CusttomAppTitleWithrightTest extends StatelessWidget {
  const CusttomAppTitleWithrightTest({
    super.key, required this.title, required this.RightWord,
  });

  final String title;
  final String RightWord;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CusttomAppTitle(title: title),
        SizedBox(width: 60),
        Flexible(
          child: Text(RightWord,
            textAlign: TextAlign.start,
            style: TextStyle(color: TColor.gray, fontSize: 12),
          ),
        ),
        SizedBox(width: 15),
      ],);
  }
}