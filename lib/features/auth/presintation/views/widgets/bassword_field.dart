import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/colo_extension.dart';
import '../../../../../common/localization/applocalizations.dart';
import '../../../../../common_widget/round_textfield.dart';
import '../../views blocs/Auth bloc/auth_bloc.dart';
import '../../../../../common_widget/custom_text_feild_prefix_icon.dart';
class BasswordField extends StatelessWidget {
  const BasswordField({
    super.key, required this.key1, required this.edit,
  });
  final GlobalKey<FormState> key1;
  final TextEditingController edit;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<showBloc, ShowPasswordState>(
      builder: (context, state) {
        return CustomTextField(
          controller: edit,
          validator: (value) => validatePassword(value, context),
          hitText: AppLocalazations.of(context)!.translate("LogInPage")["Password"] ,
          icon:Icons.lock,
          obscureText:state.isPressed? false:true,
          rigtIcon: TextButton(
            onPressed: () {
              BlocProvider.of<showBloc>(context).add(ShowPassword());
            },
            child: state.isPressed ?  Icon(
              Icons.visibility_off  , color: TColor.gray,):const CustomTextFieldPrefixIcon(
            icon: Icons.remove_red_eye,) ),
        );
      },
    );
  }
}
String? validatePassword(String? value,BuildContext context) {
  if (value == null || value.isEmpty) {
    return AppLocalazations.of(context)!.translate("LogInPage")["enter your password please"];
  }
 else if( value.length<6)
  {
    return  AppLocalazations.of(context)!.translate("LogInPage")["password vertifay"];
  }

  final RegExp passwordRegex = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$%^&*(),.?":{}|<>]).{8,}$',
  );

  // if (!passwordRegex.hasMatch(value)) {
  //   return  AppLocalazations.of(context)!.translate("LogInPage")["enter spacial character"]; }

  return null;
}