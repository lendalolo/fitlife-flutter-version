
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../common/colo_extension.dart';
import '../../../../../../common/localization/applocalizations.dart';
import '../../../../../../common/styles.dart';
import '../../../../../../common/utls/name_class.dart';
import '../../../../../../common_widget/Custom_app_button.dart';
import '../../../../../../common_widget/Loading_page.dart';
import '../../../../../../common_widget/bottom_snackbar_message.dart';
import '../../../views blocs/Auth bloc/auth_bloc.dart';
import '../sign_in_with_google_and_facebook.dart';
import 'login_form_wedgit.dart';
import '../or_spacor_wedgit.dart';

class LogInBody extends StatefulWidget {

  const LogInBody({
    super.key,
    required this.media,
  });

  final Size media;
  static GlobalKey<FormState> loginKey = GlobalKey();
  static List<TextEditingController> controller = [
    TextEditingController(),
    TextEditingController()
  ];

  @override
  State<LogInBody> createState() => _LogInBodyState();
}

class _LogInBodyState extends State<LogInBody> {
  @override
  void initState() {
    super.initState();
        BlocProvider.of<IsLogedInBloc>(context).add(IsLoged(false, LogInBody.controller));
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: BlocConsumer<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is LogInLoading) {
                return const LoadingPage();
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppLocalazations.of(context)!.translate("LogInPage")["Hey there"],
                    style: Styles.kFontSize16.copyWith(
                        color: TColor.gray, fontWeight: FontWeight.w300),
                  ),
                  Text(AppLocalazations.of(context)!.translate("LogInPage")["Welcome Back"], style: Styles.kFontSize20),
                  SizedBox(
                    height: widget.media.width * 0.09,
                  ),
                  FormWedgit(
                    loginKey: LogInBody.loginKey,
                    controller: LogInBody.controller,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppLocalazations.of(context)!.translate("LogInPage")["Forgot your password?"],
                        style: Styles.kFontSize10
                            .copyWith(decoration: TextDecoration.underline),
                      )
                    ],
                  ),
                  SizedBox(
                    height: widget.media.width * 0.04,
                  ),
                  CusttomAppButton(
                    onPressed: () {
                      if (LogInBody.loginKey.currentState!.validate()) {
                        BlocProvider.of<AuthBloc>(context).add(
                            LogIn(LogInBody.controller[0].text, LogInBody.controller[1].text));
                      }
                    },
                    title:AppLocalazations.of(context)!.translate("LogInPage")['LogIn'],
                  ),
                  SizedBox(
                    height: widget.media.width * 0.04,
                  ),
                  const OrSpaserWedgit(),
                  SizedBox(
                    height: widget.media.width * 0.04,
                  ),
                  SignUpWithGoogleAndFacebbok(media: widget.media),
                  SizedBox(
                    height: widget.media.width * 0.04,
                  ),
                  const NavigationTpRegisterpage(),
                  SizedBox(
                    height: widget.media.width * 0.04,
                  ),
                ],
              );
            },
            listener: (context, state) {
              if (state is LogInSuccess) {
                bottomSnackbarMassage(  context:context, message: AppLocalazations.of(context)!.translate("LogInPage")['Success'],);
               GoRouter.of(context).goNamed(Names.MainTabPage);


              } else if (state is LogInFailed) {
                bottomSnackbarMassage(  context: context, message:state.error,);
              }
            },
          ),
        ),
      ),
    );
  }
}

class NavigationTpRegisterpage extends StatelessWidget {
  const NavigationTpRegisterpage({super.key,});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        GoRouter.of(context).pop();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(AppLocalazations.of(context)!.translate("LogInPage")["Don’t have an account yet? "], style: Styles.kFontSize14),
          Text(
            AppLocalazations.of(context)!.translate("LogInPage")["Register"],
            style: Styles.kFontSize14
                .copyWith(color: TColor.black, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
