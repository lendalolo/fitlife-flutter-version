
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../common/localization/applocalizations.dart';
import '../../../../../../common_widget/round_textfield.dart';
import '../../../views blocs/Auth bloc/auth_bloc.dart';
import '../bassword_field.dart';
class user {
 final String name;
 final String email ;
 final String password;
  user(this.name, this.email, this.password);
}

class SignInForm extends StatelessWidget {
  const SignInForm({super.key, required this.key1, required this.edit});
  final GlobalKey<FormState> key1;

  final List<TextEditingController> edit;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: key1,
      child: Column(children: [
         CustomTextField(
           onchanged: (p0) {
             BlocProvider.of<IsLogedInBloc>(context).add(IsSign(p0.isEmpty?false:true));
           },
           controller: edit[0],
           validator: (name) {
             if(name!.isEmpty) {
               return AppLocalazations.of(context)!.translate("LogInPage")["name vertifay"];
             }
           },
          hitText: AppLocalazations.of(context)!.translate("LogInPage")["First Name"],
          icon: Icons.perm_identity,
        ),
        const SizedBox(
          height: 15,
        ),
         CustomTextField(
           onchanged: (p0) {
             BlocProvider.of<IsLogedInBloc>(context).add(IsSign(p0.isEmpty?false:true));
           },
           controller: edit[1],
           validator: (data) {
             if(data!.isEmpty || !data.contains('@')) {
               return AppLocalazations.of(context)!.translate("LogInPage")["email vertify"];
             }
           },
          hitText: AppLocalazations.of(context)!.translate("LogInPage")["Email"],
          icon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(
          height: 15,
        ),
        BasswordField(key1: key1,edit:edit[2]),
      ],),
    );
  }
}


