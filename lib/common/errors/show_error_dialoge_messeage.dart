
import 'package:flutter/material.dart';
import '../localization/applocalizations.dart';
import '../styles.dart';


void showErrorDialogMesseage(
    {required BuildContext context1,
     required String state,
      required void Function() ontaptry,
      required void Function() ontapcancel}) {
  showDialog(
    context: context1,
    builder: (context) {
      return AlertDialog(title: Text(state,style: Styles.kFontSize18,),actions: [TextButton(
        onPressed: ontapcancel,
        child:  Text(AppLocalazations.of(context)!
            .translate("Profile")["cancel"]),
      ),TextButton(
        onPressed: ontaptry,
        child: Text(AppLocalazations.of(context)!
            .translate("Profile")["try again"]),
      )],);
    },
  );
}

void showLogOutDialogMesseage(
    {required BuildContext context1,
      required String state,
      required void Function() ontaptry,
      required void Function() ontapcancel}) {
  showDialog(
    context: context1,
    builder: (context) {
      return AlertDialog(title: Text(state,style: Styles.kFontSize18,),actions: [TextButton(
        onPressed: ontapcancel,
        child:  Text(AppLocalazations.of(context)!
            .translate("Profile")["cancel"]),
      ),TextButton(
        onPressed: ontaptry,
        child: Text(AppLocalazations.of(context)!
            .translate("Profile")["log out"]),
      )],);
    },
  );
}
