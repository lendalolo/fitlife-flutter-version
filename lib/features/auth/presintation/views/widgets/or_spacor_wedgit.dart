import 'package:flutter/material.dart';

import '../../../../../common/colo_extension.dart';
import '../../../../../common/localization/applocalizations.dart';
import '../../../../../common/styles.dart';
class OrSpaserWedgit extends StatelessWidget {
  const OrSpaserWedgit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
              height: 1,
              color: TColor.gray.withOpacity(0.5),
            )),
        Text(
          AppLocalazations.of(context)!.translate("LogInPage")["  Or  "] ,
          style: Styles.kFontSize14,
        ),
        Expanded(
            child: Container(
              height: 1,
              color: TColor.gray.withOpacity(0.5),
            )),
      ],
    );
  }
}