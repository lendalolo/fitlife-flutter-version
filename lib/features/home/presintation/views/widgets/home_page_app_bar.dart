import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../common/Shared pref helper/user_cache_helper.dart';
import '../../../../../common/colo_extension.dart';
import '../../../../../common/localization/applocalizations.dart';
import '../../../../../common/servies_locator.dart';
import '../../../../../common/styles.dart';
import '../../../../auth/data/models/register_model.dart';
import '../../../notification_view.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalazations.of(context)!.translate("Profile")["Welcome Back"],
              style: Styles.kFontSize12.copyWith(color: TColor.gray),
            ),
            Text(
              user().user!.name!,
              style: Styles.kFontSize20,
            ),
          ],
        ),
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationView(),
                ),
              );
            },
            icon: Image.asset(
              "assets/img/notification_active.png",
              width: 25,
              height: 25,
              fit: BoxFit.fitHeight,
            ))
      ],
    );
  }
}
