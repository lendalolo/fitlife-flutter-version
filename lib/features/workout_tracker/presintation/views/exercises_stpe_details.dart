
import 'package:fitness/features/workout_tracker/data/models/exercieses_model.dart';
import 'package:fitness/features/workout_tracker/presintation/views_bloc/exercies%20Detailes%20bloc/exercies_detailes_bloc.dart';
import 'package:fitness/features/workout_tracker/presintation/weggits/exercies%20detailes%20wedgites/exercies_detailel_Success_wedgit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../common/errors/show_error_dialoge_messeage.dart';
import '../../../../common_widget/no_internet_no_cache_Widget.dart';
import '../../../../utls/functions/build_app_app_bar.dart';
import '../weggits/loading pages/exercies_detailes_shimmer_loading.dart';

class ExercisesStepDetails extends StatefulWidget {
  final int ExerciesId;
  final String nmeEn;
  final String nameAr;
  final int planId;

  const ExercisesStepDetails({super.key, required this.ExerciesId,  required this.planId, required this.nmeEn, required this.nameAr});

  @override
  State<ExercisesStepDetails> createState() => _ExercisesStepDetailsState();
}
//

class _ExercisesStepDetailsState extends State<ExercisesStepDetails> {
  @override
  initState() {
    super.initState();
    // BlocProvider.of<ExerciesDetailesBloc>(context)
    //     .add(ExerciesDetailesEvent(widget.ExerciesId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppAppBar(context, widget.nameAr,widget.nmeEn),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            child: BlocConsumer<ExerciesDetailesBloc, ExerciesDetailesState>(
              listener: (context, state) {
                if (state is ExerciesDetailesFailed) {
                  showErrorDialogMesseage(
                  context1:  context, state:   state.errorMessage, ontaptry:   () {
                    BlocProvider.of<ExerciesDetailesBloc>(context)
                        .add(ExerciesDetailesEvent(widget.ExerciesId));
                    GoRouter.of(context).pop();
                  }, ontapcancel: () {GoRouter.of(context).pop();},);
                }
              },
              builder: (context, state) {
                if (state is ExerciesDetailesSuccess) {
                  return ExerciesDetaileSuccessWedgit(
                    eObj: state.exerciesDetailes, planId: widget.planId,
                  );
                } else if (state is ExerciesDetailesFailed) {
                  if(state.obj != Null) {
                    return ExerciesDetaileSuccessWedgit(
                    eObj: state.obj,
                        planId: widget.planId
                  );
                  }
                return NoInternetNoCachWedgit(ontap: () {
                  BlocProvider.of<ExerciesDetailesBloc>(context)
                      .add(ExerciesDetailesEvent(widget.ExerciesId));
                  });
                }
                return const ExerciesDetailesShimmerLoading();
              },
            )),
      ),
    );
  }
}
