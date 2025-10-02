
import 'package:fitness/common_widget/Custom_app_button.dart';
import 'package:fitness/features/auth/presintation/views/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../common/localization/applocalizations.dart';
import '../../../../common/utls/name_class.dart';
import 'package:fitness/common/Shared pref helper/user_cache_helper.dart';


class WelcomeView extends StatelessWidget{
const WelcomeView();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
   //   backgroundColor: TColor.white,
      body: SafeArea(
        child: Container(
          width: media.width,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: media.width * 0.1,
              ),
              Image.asset(
                "assets/img/welcome.png",
                width: media.width * 0.75,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                height: media.width * 0.1,
              ),
               CustomTitle(
                title: "${AppLocalazations.of(context)!
                    .translate("OnCompletePage")["Welcome"]}, ${user().user?.name}",
                subTitle:
                AppLocalazations.of(context)!
                    .translate("OnCompletePage")["You are all set now, let’s reach your\ngoals together with us"] ,
              ),
              const Spacer(),
              CusttomAppButton(
                  title: AppLocalazations.of(context)!.translate("OnCompletePage")["GoToHome"],
                  onPressed: () {
                    GoRouter.of(context).goNamed(Names.MainTabPage);

                  }),
            ],
          ),
        ),
      ),
    );
  }
}
