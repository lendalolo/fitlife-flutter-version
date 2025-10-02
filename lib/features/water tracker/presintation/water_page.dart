


import 'package:fitness/common_widget/Custom_app_button.dart';
import 'package:fitness/common_widget/custtom_app_title.dart';
import 'package:fitness/features/water%20tracker/presintation/view_blocs/water%20couter%20bloc/water_counter_bloc.dart';
import 'package:fitness/features/water%20tracker/presintation/view_blocs/water_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:liquid_ball/liquid_ball.dart';

import '../../../common/colo_extension.dart';
import '../../../common/errors/show_error_dialoge_messeage.dart';
import '../../../common/localization/applocalizations.dart';
import '../../../common/styles.dart';
import '../../../common_widget/Loading_page.dart';
import '../../../common_widget/bottom_snackbar_message.dart';
import '../../../common_widget/custtom_bar_graph.dart';
import '../../../common_widget/no_internet_no_cache_Widget.dart';
import '../../food/presintation/veiwes/wedgits/app_bar_for_app_bar_property.dart';
import '../data/model/water_statistics.dart';

class WaterPage extends StatefulWidget {
  const WaterPage({super.key});

  @override
  State<WaterPage> createState() => _WaterPageState();
}

class _WaterPageState extends State<WaterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CusttomAppBarForAppBarProberty(context: context,
          title: AppLocalazations.of(context)!.translate("water")["water Tracker"] ),
      body: SingleChildScrollView(
        child: BlocConsumer<WaterBloc, WaterState>(
          listener: (context, state) {
            if(state is WaterStoreSuccess){
              BlocProvider.of<WaterBloc>(context).add(WaterStaticticsEvent());
              bottomSnackbarMassage(context: context, message: state.water.message!);
            }
            if (state is WaterFailed) {
              showErrorDialogMesseage(
                context1: context,
                state: state.errorMessage,
                ontaptry: () {
                  BlocProvider.of<WaterBloc>(context).add(WaterStaticticsEvent());GoRouter.of(context).pop();
                },
                ontapcancel: () {GoRouter.of(context).pop();},
              );
            }
          },
          builder: (context, state) {
            if(state is WaterFailed)
            {
              if (state.obj != Null) {
                return WaterSuccessWedgit( waterObj: state.obj);
              }
              return NoInternetNoCachWedgit(
                ontap: () {
                  BlocProvider.of<WaterBloc>(context)
                      .add(WaterStaticticsEvent());
                },
              );
            }
            else if(state is WaterStatisticsSuccess)
            {
              return WaterSuccessWedgit( waterObj: state.water,);
            }
            return Center(child: LoadingPage());
          },
        ),
      ),
    );
  }
}

class WaterSuccessWedgit extends StatelessWidget {
  final WaterStatistics waterObj;
  const WaterSuccessWedgit({
    super.key,  required this.waterObj,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
          child: CusttomAppTitle(title: AppLocalazations.of(context)!.translate("water")["Water Scadual"] ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: CusttomBarGraph(x: waterObj.data!.x!, y:waterObj.data!.y!,lengthOfTheBar:waterObj.data!.lenghtOfY.toDouble() ,),
        ) ,
        Container(
          margin: EdgeInsets.all(24),
          height: MediaQuery.of(context).size.height* 0.5,
          decoration: BoxDecoration(
           gradient: TColor.kmainGradint,borderRadius: BorderRadius.circular(24)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(900),
                      color: Colors.transparent,
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.white,
                      //     blurRadius: 100,
                      //     spreadRadius: 50,
                      //     offset: Offset(0, 0),
                      //   ),
                      // ],
                    ),
                    child: LiquidBallWidget(
                      percentage: waterObj.data!.targets!.isNotEmpty?
                      double.parse(waterObj.data!.targets![0].water!) >=double.parse(waterObj.data!.water!)?1:
                      double.parse(waterObj.data!.targets![0].water!) /
                          double.parse(waterObj.data!.water!):0,
                      waveGradient: const LinearGradient(
                        colors: [
                          Color(0xFFFfffff),
                          Color(0xFFFfffff), Color(0xFFFfffff), Color(0xFFFfffff),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      containerPadding: 10,
                      containerBorder: Border.all(
                        color: Color(0xffffffff),
                      //  Color(0xFF2CABFF),
                        width: 4,
                      ),
                      containerSize: 100,
                    ),
                  ),
                  Text(
                    (waterObj.data!.targets!.isNotEmpty && waterObj.data?.targets?[0].water != null &&
                        waterObj.data?.water != null &&
                        double.tryParse(waterObj.data!.water!) != 0)
                        ? '${(double.parse(waterObj.data!.targets![0].water!) /
                        double.parse(waterObj.data!.water!) * 100).toStringAsFixed(1)}%'
                        : '0%',
                    style: TextStyle(color: TColor.primaryColor1, fontSize: 30),
                  )
                ],
              ),
              SizedBox(height:45 ,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<WaterCounterBloc>(context)
                          .add(WaterCounterEventDecrement());
                    },
                    icon: Icon(
                      Icons.arrow_circle_right_outlined,
                      size: 60,
                      color: TColor.white,
                    ),
                  ),
                  BlocBuilder<WaterCounterBloc, WaterCounterState>(
                    builder: (context, state) {
                      return Container(
                        alignment: AlignmentDirectional.center,
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: TColor.white,
                            borderRadius: BorderRadius.circular(900)),
                        child: Center(
                            child: Text(
                              '${state.i}L',
                              style: TextStyle(color: TColor.primaryColor1,fontSize: 24),
                            )),
                      );
                    },
                  ),
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<WaterCounterBloc>(context)
                          .add(WaterCounterEventIncrement());
                    },
                    icon: Icon(
                      Icons.arrow_circle_left_outlined,
                      size: 60,
                      color: TColor.white,
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
        BlocBuilder<WaterCounterBloc, WaterCounterState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(23.0),
              child: CusttomAppButton(title: AppLocalazations.of(context)!.translate("water")["Add My Water Amount"]  , onPressed: () {
                BlocProvider.of<WaterBloc>(context).add(WaterStoreEvent(state.i));

              },),
            );
          },
        ),

      ],
    );
  }
}