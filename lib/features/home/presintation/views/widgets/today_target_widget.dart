
import 'package:flutter/material.dart';
import '../../../../../common/colo_extension.dart';
import '../../../../../common/localization/applocalizations.dart';
import '../../../../../common/styles.dart';
import '../../../../../common_widget/round_button.dart';

class TodayTargetWidget extends StatelessWidget {
  final String text;
  final VoidCallback ontap;
  const TodayTargetWidget({
    super.key, required this.text, required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
        color: TColor.primaryColor2.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Styles.kFontSize14
                .copyWith(color: TColor.black, fontWeight: FontWeight.w700),
          ),
          RoundButton(
            height: 30,
            fontStyle: Styles.kFontSize14.copyWith(fontWeight: FontWeight.w700),
            minWidth: 20,
            title: AppLocalazations.of(context)!.translate("GoalsPage")["Check"],
            onPressed: ontap,
          )
        ],
      ),
    );
  }
}