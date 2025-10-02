import 'package:fitness/common/utls/name_class.dart';
import 'package:fitness/features/workout_tracker/presintation/views_bloc/plans%20bloc/plans_bloc.dart';
import 'package:fitness/features/workout_tracker/presintation/weggits/exercies%20detailes%20wedgites/vedio_holder_wedgit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as GoRoter;
import 'package:go_router/go_router.dart';
import '../../../../../common/colo_extension.dart';
import '../../../../../common/common blocs/languge blocs/languge_bloc.dart';
import '../../../../../common/localization/applocalizations.dart';
import '../../../../../common/styles.dart';
import '../../../../../common_widget/Custom_app_button.dart';
import '../../../../../common_widget/custtom_read_more_text_widget.dart';
import '../../../data/models/exercies_detailes_models.dart';
import '../calories_picker.dart';
import 'exercies_detailes_how_to_do_it_wedgit.dart';
class ExerciesDetaileSuccessWedgit extends StatelessWidget {
  final ExerciesDetailes eObj;
  final int planId;
  const ExerciesDetaileSuccessWedgit({super.key, required this.eObj, required this.planId});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VedioHolderWidget(media: media, widget: eObj),
        const SizedBox(
          height: 15,
        ),
        BlocBuilder<LangugeBloc, LangugeState>(
          builder: (context, state) {
            return Text(
              state.locale == const Locale('ar') ? eObj.titleAr
                  .toString() : eObj.title.toString(),
              style: Styles.kFontSize16,
            );
          },
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          "${eObj.duration.toString()}${AppLocalazations.of(context)!.translate("ExercisesPage")["Duration"]} | ${eObj.calories.toString()} ${AppLocalazations.of(context)!.translate("GoalsPage")["calories"]}",
          style: Styles.kFontSize12.copyWith(color: TColor.gray),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          ' ${AppLocalazations.of(context)!.translate('ExercisesPage')["Descriptions"]}',
          style: Styles.kFontSize16,
        ),
        const SizedBox(
          height: 4,
        ),
        BlocBuilder<LangugeBloc, LangugeState>(
          builder: (context, state) {
            return CusttomReadMoreTextWedgit(
              text: state.locale == const Locale('ar') ? '${eObj
                  .descriptionAr}' : '${eObj.description}',);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${AppLocalazations.of(context)!.translate("ExercisesPage")["How To Do It"]}',
              style: Styles.kFontSize16,
            ),
            Text(
              "${eObj.steps!.length} '${AppLocalazations.of(context)!.translate("ExercisesPage")["Sets"]}'",
              style: Styles.kFontSize12.copyWith(color: TColor.gray),
            )
          ],
        ),
        ExerciesDetailesHowToDoItWidget(stepArr: eObj.steps!),
        const SizedBox( height: 45,),
    // CusttomAppButton(
    //         title:'${AppLocalazations.of(context)!.translate("ExercisesPage")[" Finished "]}' ,
    // elevation: 0, onPressed: () {
    //          GoRouter.of(context).pushNamed(Names.ExercisCounter,extra: eObj);}),
            //  BlocProvider.of<PlansBloc>(context).add(ExerciesSubmitEvent(12, eObj.id!, planId));
       //  Text(
       //    '${AppLocalazations.of(context)!.translate("ExercisesPage")["Custom Repetitions"]}' ,
       //    style: Styles.kFontSize16,),
       // CaloriesBicker(obj: eObj, onPressed: (int calore) { caloreamount=calore; },),
        BlocBuilder<PlansBloc, PlansState>(
        builder: (context, state) {
          if(state is ExerciesSubmitSuccess)
            {return CusttomAppButton(
              //state.exerciesData.message!
                  title: state.exerciesData.message!, elevation: 0, onPressed: () async {
                 print(planId);
                 await  GoRouter.of(context).pushNamed(Names.ExercisCounter,extra: eObj);
                 BlocProvider.of<PlansBloc>(context).add(ExerciesSubmitEvent(eObj.calories!, eObj.id!, planId));
              });
            }
          if(state is ExerciesSubmitLoading)
          { return const Center(child: CircularProgressIndicator());
          }
          if(state is ExerciesSubmitFailed)
          { return CusttomAppButton(
              title:state.errorMessage , elevation: 0, onPressed: () async {
            await  GoRouter.of(context).pushNamed(Names.ExercisCounter,extra: eObj);
            BlocProvider.of<PlansBloc>(context).add(ExerciesSubmitEvent(eObj.calories!, eObj.id!, planId));
          });
          }
          return CusttomAppButton(
            title:'${AppLocalazations.of(context)!.translate("ExercisesPage")["Start Practice"]}' , elevation: 0, onPressed: () async {
           await  GoRouter.of(context).pushNamed(Names.ExercisCounter,extra: eObj);
               BlocProvider.of<PlansBloc>(context).add(ExerciesSubmitEvent(eObj.calories!, eObj.id!, planId));
        });
  },
),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
