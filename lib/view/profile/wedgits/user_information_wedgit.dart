import 'package:flutter/material.dart';

import '../../../common/Shared pref helper/user_cache_helper.dart';
import '../../../common/localization/applocalizations.dart';
import '../../../common_widget/title_subtitle_cell.dart';

class UserInformationWedgit extends StatelessWidget {
  const UserInformationWedgit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: 800,
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: TitleSubtitleCell(
                  title: "${user().user!.height??""}cm",
                  subtitle: AppLocalazations.of(context)!.translate("Profile")["Height"],
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: TitleSubtitleCell(
                  title: "${user().user!.width??""}kg",
                  subtitle: AppLocalazations.of(context)!.translate("Profile")["Weight"],
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: TitleSubtitleCell(
                  title: "${user().user!.age??""}y",
                  subtitle: AppLocalazations.of(context)!.translate("Profile")["Age"],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: TitleSubtitleCell(
                  title: user().user!.address??"",
                  subtitle: AppLocalazations.of(context)!.translate("Profile")["Address"],
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: TitleSubtitleCell(
                  title: "${user().user!.gender??""}",
                  subtitle: AppLocalazations.of(context)!.translate("Profile")["Gender"],
                ),
              ),

            ],
          ),
          SizedBox(
            height: 15,
          ),
          TitleSubtitleCell(
            title: "${user().user!.illness??""}",
            subtitle: AppLocalazations.of(context)!.translate("Profile")["illness"],
          ),
          SizedBox(
            height: 15,
          ),

        ],
      ),
    );
  }
}