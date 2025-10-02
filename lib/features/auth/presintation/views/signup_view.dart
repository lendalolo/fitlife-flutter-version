
import 'package:fitness/common/servies_locator.dart';
import 'package:fitness/features/auth/presintation/views/widgets/signup/sign_up%20body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/reop/register_repo_impl.dart';
import '../views blocs/Auth bloc/auth_bloc.dart';
import '../views blocs/policy bloc/policy_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(getIt.get<AuthImpl>()),
        ),
        BlocProvider(
          create: (context) => PolicyBloc(),
        ),
        BlocProvider(
          create: (context) => showBloc(),
        ),
        BlocProvider(create: (context) => IsLogedInBloc(),)
      ],
      child: Scaffold(
        body: SignUpBody(media: media),
      ),
    );
  }
}
