import 'package:fitness/common_widget/no_internet_no_cache_Widget.dart';
import 'package:fitness/features/workout_tracker/presintation/weggits/plans%20widgets/planes_sucsses_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../common/errors/show_error_dialoge_messeage.dart';
import '../../../data/models/goales_model.dart';
import '../../views_bloc/plans bloc/plans_bloc.dart';
import '../loading pages/muscles_shimmer_loading.dart';


class MusclesWedgit extends StatefulWidget {
  final Data dObj;
  const MusclesWedgit({super.key, required this.dObj});

  @override
  State<MusclesWedgit> createState() => _MusclesWedgitState();
}
int mindex =0;
class _MusclesWedgitState extends State<MusclesWedgit> {
  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;

    return BlocConsumer<PlansBloc, PlansState>(
      builder: (context, state) {
        if (state is PlansSuccess) {
          return PlanesSuccessWedgit( plan: state.plan,);
        }
        if (state is PlansFailed) {
          if(state.obj != Null) {
          //  print(state.obj);
            return PlanesSuccessWedgit( plan: state.obj,);
          } else{
            return NoInternetNoCachWedgit(ontap: (){
              BlocProvider.of<PlansBloc>(context)
                .add(PlansEvent(widget.dObj.id!.toInt()));
            });
          }
        }
        return MusclesShimmerLoading(media: media);
      },
      listener: (context1, state) {
        if (state is PlansFailed)
        {
          showErrorDialogMesseage( context1: context1, state:  state.errorMessage, ontaptry: (){
            BlocProvider<PlansBloc>.value(
              value: BlocProvider.of<PlansBloc>(context)
                ..add(PlansEvent(widget.dObj.id!.toInt())),
            );
            GoRouter.of(context).pop();
          }, ontapcancel:(){GoRouter.of(context).pop();},);
        }
      },
    );
  }
}
