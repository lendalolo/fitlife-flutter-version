import 'package:flutter/material.dart';

import '../../../../../../common/colo_extension.dart';


IconButton timeDateShowDebage(BuildContext context, TextEditingController txtDate) {
  return IconButton(
    onPressed: () async {
    DateTime? dateTime = await showDatePicker(
        context: context,
        firstDate: DateTime(1950),
        lastDate: DateTime(DateTime.now().year),

      );
    if(dateTime != null) {
      txtDate.text = '${dateTime.year.toString()}/${dateTime.month.toString()}/${dateTime.day.toString()}';
    }
    },
    icon: Icon(
      Icons.date_range_outlined,
      color: TColor.gray,
    ),
  );
}