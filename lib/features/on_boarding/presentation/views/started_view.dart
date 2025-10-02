import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/common_widget/Loading_page.dart';
import 'package:fitness/features/on_boarding/presentation/views/widgets/started_view_body.dart';
import 'package:fitness/features/on_boarding/presentation/views_bloc/opening%20app%20bloc/opining_app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../common/utls/name_class.dart';
import '../../../workout_tracker/presintation/views_bloc/plans bloc/plans_bloc.dart';

class StartedView extends StatelessWidget {
  const StartedView({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocConsumer<OpiningAppBloc, OpiningAppState>(
        listener: (context, state) {
          if(state is OpiningAppSucsses) {
          //  getIt.get<UserCacheHelper>().deleteUserCache('user');
          //   BlocProvider.of<PlansBloc>(context)
          //       .add(ExerciesEvent(1,3, 2));
            GoRouter.of(context).go(Names.startApplication);
          }
        },
        builder: (context, state) {
          if( state is OpiningAppInitial) {
            return Container(
                width: media.width,
                decoration: const BoxDecoration(
                  gradient: TColor.kmainGradint,),
                child: const StartedViewBody());
          }
       else {
            return const LoadingPage();
          }
        },
      ),
    );
  }
}


