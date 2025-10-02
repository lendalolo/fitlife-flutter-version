import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/colo_extension.dart';
import '../../../../../common/common blocs/languge blocs/languge_bloc.dart';
import '../../../../../common/localization/applocalizations.dart';
import '../../../../../common/styles.dart';
import '../../../../../common/utls/name_class.dart';
import '../../../data/models/exercieses_model.dart';
import 'exercises_set_section.dart';
import '../../views_bloc/plans bloc/plans_bloc.dart';

class PlanExerciesWidgit extends StatefulWidget {
  final Exercieses state;
  final int planIDforExercies;
  const PlanExerciesWidgit({
    super.key, required this.state, required this.planIDforExercies,
  });

  @override
  State<PlanExerciesWidgit> createState() => _PlanExerciesWidgitState();
}

class _PlanExerciesWidgitState extends State<PlanExerciesWidgit> {
 int selectButton=0;
 @override
  void initState() {
  // context.read<LangugeBloc>().state.locale ==Locale("ar")?selectButton=1:selectButton=0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(
               '${AppLocalazations.of(context)!.translate('ExercisesPage')["Exercises"]}' ,
                style: Styles.kFontSize16,
              ),
              // Text(
              //   "${widget.state.data!.exercise!.length} ${AppLocalazations.of(context)!.translate('ExercisesPage')["Exercises"]}",
              //   style: Styles.kFontSize12.copyWith(color: TColor.gray),
              // )
            ],
          ),
          Container(
            height: 55,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: TColor.lightGray,
                borderRadius: BorderRadius.circular(30)),
            child: Stack(alignment: Alignment.center, children: [
              AnimatedContainer(
                alignment: context.read<LangugeBloc>().state.locale ==const Locale("ar")?
                selectButton == 1
                    ? Alignment.centerLeft
                    : Alignment.centerRight: selectButton == 0
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  width: (MediaQuery.of(context).size.width * 0.5) - 40,
                  height: 40,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: TColor.primaryG),
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
              SizedBox(
                height: 40,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectButton = 0;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30)),
                          child: Text(
                            AppLocalazations.of(context)!.translate('ExercisesPage')["woman"],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: selectButton == 0
                                    ? TColor.white
                                    : TColor.gray,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectButton = 1;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30)),
                          child: Text(
                            AppLocalazations.of(context)!.translate('ExercisesPage')["men"],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: selectButton == 1
                                    ? TColor.white
                                    : TColor.gray,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
          ExercisesSetSection(
            sObj:selectButton == 1? widget.state.men:widget.state.womans,
            onPressed: (obj) async{
              print(widget.state.isCheckedman.length);
            //  print(state.data!.targets)
           await   GoRouter.of(context).push(Names.ExercisesStepDetails,extra:[obj.id,obj.titleAr,
             widget.planIDforExercies,obj.title] );
           BlocProvider.of<PlansBloc>(context).add(
               ExerciesEvent(widget.planIDforExercies));
            },
            checkList:selectButton == 1?
          widget.state.isCheckedman:widget.state.isCheckedwoman ,
          )
        ],
      ),
    );
  }
}