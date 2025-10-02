import 'package:fitness/features/workout_tracker/presintation/views_bloc/rigester%20in%20goal%20bloc/register_in_goal_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../common/errors/show_error_dialoge_messeage.dart';
import '../../../../../common/localization/applocalizations.dart';
import '../../../../../common_widget/Custom_app_button.dart';
import '../../../../../common_widget/bottom_snackbar_message.dart';
import '../../views/plans_view.dart';
import '../../views_bloc/plans bloc/plans_bloc.dart';
class RegisterInGoalButton extends StatelessWidget {
  const RegisterInGoalButton({
    super.key,
    required this.widget,
  });

  final PlansView widget;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlansBloc, PlansState>(
      builder: (context, state) {
        if(state is PlansSuccess) {
          if(state.plan.date!.isEmpty) {
            return  Align(alignment: Alignment.bottomCenter,child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: BlocConsumer<RegisterInGoalBloc,RegisterInGoalState>(builder: (context, state) {
                if(state is GoalesSubmitLoading)
                {
                return  const CircularProgressIndicator();
                }
                if(state is GoalesSubmitSuccess)
                {
                 return const SizedBox();
                }
                return CusttomAppButton(title: ' ${AppLocalazations.of(context)!.translate('GoalsPage')["Rigester in this Goal "]}',
                    elevation: 0, onPressed: () {
                      BlocProvider.of<RegisterInGoalBloc>(context).add(RegisterInGoalEvent(widget.dObj.id!));
                    });
              }, listener: (context, state) {
                if(state is GoalesSubmitFailed)
                {
                  showErrorDialogMesseage( context1:context, state: state.errorMessage, ontaptry: () {
                    GoRouter.of(context).pop();
                    BlocProvider.of<RegisterInGoalBloc>(context).add(RegisterInGoalEvent(widget.dObj.id!));
                  }, ontapcancel: () {
                    GoRouter.of(context).pop();
                  });
                }
                if(state is GoalesSubmitSuccess)
                {
                  bottomSnackbarMassage(context: context, message: state.exerciesData.data!);
                }
              },),
            ));
          } else {
            return const SizedBox();
          }
        }
        return const SizedBox();
      },
    );
  }
}