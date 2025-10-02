
import 'dart:convert';

import 'package:fitness/common_widget/Loading_page.dart';
import 'package:fitness/features/auth/presintation/views/widgets/complete%20imformation/complite_profile_success_wedgit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../common/Shared pref helper/shared_pref.dart';
import '../../../../common/Shared pref helper/user_cache_helper.dart';
import '../../../../common/localization/applocalizations.dart';
import '../../../../common/servies_locator.dart';
import '../../../../common/utls/name_class.dart';
import '../../../../common_widget/bottom_snackbar_message.dart';
import '../../data/models/register_model.dart';
import '../../data/models/user_data_errorAndNoterror_model.dart';
import '../views blocs/Auth bloc/auth_bloc.dart';

class CompleteProfileView extends StatelessWidget {
  CompleteProfileView({super.key, required this.isEditing,  this.registerModel, });
  static GlobalKey<FormState> completeKey = GlobalKey();
  final bool isEditing;
  final RegisterModel? registerModel;
  final List<TextEditingController> textControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AddUserInformationSuccess) {
                if (isEditing == true)
                {
                  bottomSnackbarMassage(
                    context: context,
                    message: AppLocalazations.of(context)!
                        .translate("OnCompletePage")['Updated Success'],
                  );
               //   GoRouter.of(context).pop();

                }
                if (isEditing != true) {
                  bottomSnackbarMassage(
                    context: context,
                    message: AppLocalazations.of(context)!
                        .translate("LogInPage")['Success'],
                  );
                  GoRouter.of(context).pushNamed(Names.ConfirmRegisterPage);
                }

              } else if (state is AddUserInformationFailed) {
                bottomSnackbarMassage(context: context, message: state.error);
              }
            },
            builder: (context, state) {
              if (state is AddUserInformationLoading) {
                return LoadingPage();
              }
              return CompleateProfileSuccessWedgit(
                  media: media,
                  completeKey: completeKey,
                  textControllers: textControllers, isUpdating: isEditing, registerModel: registerModel, );
            },
          ),
        ),
      ),
    );
  }
}
