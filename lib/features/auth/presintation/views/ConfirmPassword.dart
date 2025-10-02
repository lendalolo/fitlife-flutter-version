
import 'dart:convert';

import 'package:fitness/common_widget/Loading_page.dart';
import 'package:fitness/features/auth/presintation/views/widgets/complete%20imformation/complite_profile_success_wedgit.dart';
import 'package:fitness/features/auth/presintation/views/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../common/Shared pref helper/shared_pref.dart';
import '../../../../common/Shared pref helper/user_cache_helper.dart';
import '../../../../common/localization/applocalizations.dart';
import '../../../../common/servies_locator.dart';
import '../../../../common/utls/name_class.dart';
import '../../../../common_widget/Custom_app_button.dart';
import '../../../../common_widget/bottom_snackbar_message.dart';
import '../../../../common_widget/custtom_app_title.dart';
import '../../../../common_widget/round_textfield.dart';
import '../../data/models/register_model.dart';
import '../../data/models/user_data_errorAndNoterror_model.dart';
import '../views blocs/Auth bloc/auth_bloc.dart';

class ConfirmRegisterPage extends StatefulWidget {
  ConfirmRegisterPage({super.key });
  static GlobalKey<FormState> registerConfirmKey = GlobalKey();

  @override
  State<ConfirmRegisterPage> createState() => _ConfirmRegisterPageState();
}

class _ConfirmRegisterPageState extends State<ConfirmRegisterPage> {
  final List<TextEditingController> textControllers = [
    TextEditingController(),

  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is ConfirmRegisterSuccess) {
                  bottomSnackbarMassage(
                    context: context,
                    message: AppLocalazations.of(context)!
                        .translate("LogInPage")['Success'],
                  );
                  // GoRouter.of(context).pushNamed(Names.WhatYorGoalesPage);
                  GoRouter.of(context).goNamed(Names.WelcomePage);

              } else if (state is ConfirmRegisterFailed) {
                bottomSnackbarMassage(context: context, message: state.error);
              }
            },
            builder: (context, state) {
              if (state is ConfirmRegisterLoading) {
                return LoadingPage();
              }
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/img/complete_profile.png",
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fitWidth,
                    ),
                    SizedBox(
                      height:MediaQuery.of(context).size.width * 0.05,
                    ),
                    CustomTitle(title:AppLocalazations.of(context)!
                        .translate("OnCompletePage")["Write The Code That We Send It To Your Email"]  ,
                      subTitle:AppLocalazations.of(context)!
                          .translate("OnCompletePage")["THis Move Is So Important For You"]
                      ,),
                    SizedBox(
                      height: MediaQuery.of(context).size.width* 0.05,
                    ),
                    Form(
                      key: ConfirmRegisterPage.registerConfirmKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            validator: (data) {
                              if (data!.isEmpty) {
                                return AppLocalazations.of(context)!
                                    .translate("OnCompletePage")['code'];
                              }
                              return null;
                            },
                            controller: textControllers[0],
                            onchanged:(p0) {
                              setState(() {

                              });
                            } ,
                            hitText: AppLocalazations.of(context)!
                                .translate("OnCompletePage")['code'],
                            icon: Icons.code,

                          ),
                          const SizedBox(
                            height: 16,
                          ),



                          SizedBox(height: 15,),

                        ],
                      ),
                    ),
                 textControllers[0]!.text.isEmpty?CusttomUnabelAppButton(
                  title: AppLocalazations.of(context)!
                      .translate("OnCompletePage")["Submit"],
                  onPressed: () {

                  }): CusttomAppButton(
                        title: AppLocalazations.of(context)!
                            .translate("OnCompletePage")["Submit"],
                        onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(ConfirmRegisterEvent(int.parse(textControllers[0].text)));

                        }),
                    const SizedBox(
                      height: 32,
                    ),

                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
