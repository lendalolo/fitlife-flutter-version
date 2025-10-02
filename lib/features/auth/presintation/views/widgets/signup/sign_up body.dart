import 'package:fitness/common/utls/name_class.dart';
import 'package:fitness/features/auth/presintation/views/widgets/signup/sign_in_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../common/colo_extension.dart';
import '../../../../../../common/localization/applocalizations.dart';
import '../../../../../../common/styles.dart';
import '../../../../../../common_widget/Custom_app_button.dart';
import '../../../../../../common_widget/Loading_page.dart';
import '../../../../../../common_widget/bottom_snackbar_message.dart';
import '../../../views blocs/Auth bloc/auth_bloc.dart';
import '../../../views blocs/policy bloc/policy_bloc.dart';
import '../sign_in_with_google_and_facebook.dart';
import 'custom_check_box.dart';
import '../or_spacor_wedgit.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key, required this.media,
  });

  final Size media;
  static GlobalKey<FormState> key1 = GlobalKey();

  static List<TextEditingController> controller = [
    TextEditingController(),
    TextEditingController()
    , TextEditingController()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(builder: (context, state) {
      if (state is SignUpLoading) {
        return const LoadingPage();
      }
      return SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppLocalazations.of(context)!.translate("LogInPage")["Hey there"],
                  style: Styles.kFontSize16
                      .copyWith(
                      fontWeight: FontWeight.w300, color: TColor.gray),
                ),
                Text(AppLocalazations.of(context)!.translate("LogInPage")["Create an Account"], style: Styles.kFontSize20),
                SizedBox(
                  height: media.width * 0.05,
                ),
                SignInForm(key1: key1, edit: controller,),
                Row(
                  children: [
                    BlocBuilder<PolicyBloc, CheckPolicyState>(
                      builder: (context, state) {
                        return CustomCheckBox(state: state,);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                       AppLocalazations.of(context)!.translate("LogInPage")["Policy"],
                        style: TextStyle(color: TColor.gray, fontSize: 10),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: media.width * 0.4,
                ),
                CusttomAppButton(
                  title:AppLocalazations.of(context)!.translate("LogInPage")["Sign Up"],
                  onPressed: () {
                    if (key1.currentState!.validate()) {
                      BlocProvider.of<AuthBloc>(context).add(Register(
                          controller[0].text, controller[1].text,
                          controller[2].text));
                    }
                  },
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                const OrSpaserWedgit(),
                SizedBox(
                  height: media.width * 0.04,
                ),
                SignUpWithGoogleAndFacebbok(media: media),
                SizedBox(
                  height: media.width * 0.04,
                ),
                const NavigateIntoLoginPage(),
                SizedBox(
                  height: media.width * 0.04,
                ),
              ],
            ),
          ),
        ),
      );
    }, listener: (context, state) {
      if (state is SignUpSuccess) {
        bottomSnackbarMassage(context: context, message: AppLocalazations.of(context)!.translate("LogInPage")["Success"], );
        GoRouter.of(context).pushReplacementNamed(Names.CompletInformationPage,extra: [false,null]);

      }
      else if (state is SignUpFailed) {
        bottomSnackbarMassage(  context: context, message: state.error,);
      }
    },);
  }

}


class NavigateIntoLoginPage extends StatelessWidget {
  const NavigateIntoLoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        GoRouter.of(context).pushNamed(Names.LogIn);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(AppLocalazations.of(context)!.translate("LogInPage")["Already have an account? "],
              style:
              Styles.kFontSize14.copyWith(color: TColor.black)),
          Text(
            AppLocalazations.of(context)!.translate("LogInPage")["LogIn"],
            style: Styles.kFontSize14.copyWith(
                color: TColor.black, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}