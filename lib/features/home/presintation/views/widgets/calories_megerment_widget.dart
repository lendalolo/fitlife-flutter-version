import 'package:flutter/material.dart';

import '../../../../../common/localization/applocalizations.dart';
import 'app_tracker_container.dart';
import 'app_tracker_container_title.dart';
import 'calories_animation_progress_indicator.dart';

class CaloriesMegermentWidget extends StatefulWidget {
  final int cal;
  final String text;
  const CaloriesMegermentWidget({
    super.key,
    required this.cal, required this.text,
  });



  @override
  State<CaloriesMegermentWidget> createState() => _CaloriesMegermentWidgetState();

}

class _CaloriesMegermentWidgetState extends State<CaloriesMegermentWidget> {
  @override
  void didUpdateWidget(covariant CaloriesMegermentWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.cal != widget.cal || oldWidget.text != widget.text) {
      setState(() {}); // ensure UI refresh on value change
    }
  }
  @override
  Widget build(BuildContext context) {
    Size media =MediaQuery.of(context).size;
    return AppTrackerContainer(media: 200, child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           AppTrackerContainerTitle(title: widget.text, gradiantText: "${widget.cal} ${widget.text}"),
          SizedBox(height: 15,),
          CaloriesAnimationProgressIndicator(media: media,quantity: widget.cal.toDouble(),
            text:"%${AppLocalazations.of(context)!
              .translate("plans statistic")["Cal"] }",)
        ]));
  }
}