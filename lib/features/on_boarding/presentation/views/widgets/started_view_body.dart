import 'package:fitness/common/localization/applocalizations.dart';
import 'package:fitness/common_widget/round_button.dart';
import 'package:fitness/features/on_boarding/presentation/views_bloc/opening%20app%20bloc/opining_app_bloc.dart';
import 'package:fitness/features/workout_tracker/data/models/plans_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../common/styles.dart';
import '../../../../workout_tracker/presintation/views_bloc/plans bloc/plans_bloc.dart';


class StartedViewBody extends StatelessWidget {
  const StartedViewBody({super.key,});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Text(
            "No Pain No Gain",
            style: Styles.kFontSize36
        ),
        Text(
            AppLocalazations.of(context)!.translate('StartUpPage')["EverybodyCanTrain"],
            style: Styles.kFontSize18
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: RoundButton(
            title:  AppLocalazations.of(context)!.translate('StartUpPage')["GetStarted"],
            onPressed: ()  {
              BlocProvider.of<OpiningAppBloc>(context).add(OpiningAppEvent());

             // getIt.get<UserCacheHelper>().deleteUserCache('user');
            },
          ),
        ),
      ],
    );
  }
}