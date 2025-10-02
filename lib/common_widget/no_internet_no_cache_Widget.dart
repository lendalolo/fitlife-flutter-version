import 'package:fitness/common/localization/applocalizations.dart';
import 'package:flutter/material.dart';

import 'Custom_app_button.dart';

class NoInternetNoCachWedgit extends StatelessWidget {
  final VoidCallback ontap;
  const NoInternetNoCachWedgit({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/img/noData.png'),
        const SizedBox(height: 50,),
        CusttomAppButton(
          title: AppLocalazations.of(context)!.translate("general")["try again"],
          onPressed: ontap,
        )
      ],
    );
  }
}
