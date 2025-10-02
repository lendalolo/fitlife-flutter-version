import 'package:flutter/material.dart';
import '../../../../../../common/localization/applocalizations.dart';
import '../../../../../../common_widget/round_textfield.dart';
import '../bassword_field.dart';

class FormWedgit extends StatelessWidget {
  final GlobalKey<FormState> loginKey;
  final List<TextEditingController> controller;
  const FormWedgit({super.key, required this.loginKey, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Form(key: loginKey,child: Column(children: [
      CustomTextField(
        controller: controller[0],
        validator: (data) {
          if(data!.isEmpty || !data.contains('@')) {
            return AppLocalazations.of(context)!.translate("LogInPage")['enter your email please'] ;
          }
        },
        hitText: AppLocalazations.of(context)!.translate("LogInPage")["Email"],
        icon: Icons.email,
        keyboardType: TextInputType.emailAddress,
      ),
      const SizedBox(
        height: 15,
      ),
      BasswordField(key1: loginKey, edit: controller[1],),
      const SizedBox(
        height: 15,
      ),
    ],));
  }
}