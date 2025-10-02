import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/features/workout_tracker/presintation/views_bloc/plans%20bloc/plans_bloc.dart';
import 'package:fitness/features/workout_tracker/presintation/weggits/plans%20widgets/plans_body.dart';
import 'package:fitness/features/workout_tracker/presintation/weggits/workout_detailes_view_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../common/api_servieses.dart';
import '../../../../common/servies_locator.dart';
import '../../data/models/goales_model.dart';
import '../../data/models/plans_model.dart';
import '../weggits/plans widgets/register_in_goal_button.dart';

class PlansView extends StatefulWidget {
  final Data dObj;
  const PlansView({super.key, required this.dObj});

  @override
  State<PlansView> createState() => _PlansViewState();
}

class _PlansViewState extends State<PlansView> {
  @override
  initState() {
    super.initState();
    BlocProvider.of<PlansBloc>(context)
        .add(PlansEvent(widget.dObj.id!.toInt()));
  }

  late plans myPlan;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(gradient: TColor.kmainGradint),
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return workOutDetilesViewAppBar(
              media, '$imageBaseUrl${widget.dObj.media![0].originalUrl!.split('8000/').last}', '');
        },
        body: RefreshIndicator(
          onRefresh: () {
            return Future(() {
              BlocProvider<PlansBloc>.value(
                value: BlocProvider.of<PlansBloc>(context)
                  ..add(PlansEvent(widget.dObj.id!.toInt())),
              );
            });
          },
          child: Stack(
            children: [
              PlansBody(
                media: media,
                dObj: widget.dObj,
              ),
              getIt.get<SharedPreferences>().getString('user') == null ||
                  getIt.get<SharedPreferences>().getString('user')!.isEmpty?SizedBox():
              RegisterInGoalButton(widget: widget),
            ],
          ),
        ),
      ),
    );
  }
}
