import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/features/auth/presintation/views/widgets/login/login_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/servies_locator.dart';
import '../../data/reop/register_repo_impl.dart';
import '../views blocs/Auth bloc/auth_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => showBloc(),
          ),
          BlocProvider(
            create: (context) => AuthBloc(getIt.get<AuthImpl>()),
          ),
          BlocProvider(
            create: (context) => IsLogedInBloc(),
          )

        ],
        child: Scaffold(
          body: LogInBody(media: media),
        ));
  }
}
