import 'package:fitness/common/servies_locator.dart';
import 'package:fitness/common/utls/name_class.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'localization/applocalizations.dart';
class UserNotSignUpWedgit extends StatelessWidget {
  final String message;
  const UserNotSignUpWedgit({
    super.key, required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(message),
        const SizedBox(height: 5,),
         getIt.get<SharedPreferences>().getString('user') ==null?
         TextButton(onPressed: (){
          GoRouter.of(context).push(Names.SignUp);
        }, child:  Row(mainAxisAlignment: MainAxisAlignment.center,
           children: [Text("${AppLocalazations.of(context)!.translate("LogInPage")["Register"]} "),
             Icon(Icons.arrow_circle_right)],)):Container(),
      ],
    );
  }
}
//'what your waitting for sign up and start your journy with us .. '