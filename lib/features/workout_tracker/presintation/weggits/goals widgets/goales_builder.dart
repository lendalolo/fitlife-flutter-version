
import 'package:fitness/common_widget/no_internet_no_cache_Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../common/errors/show_error_dialoge_messeage.dart';
import '../../views_bloc/goals bloc/goals_bloc.dart';
import 'what_train_row.dart';
import '../loading pages/goales_item_shimmer_loading.dart';
class GoalesBulider extends StatelessWidget {
  const GoalesBulider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GoalsBloc,GoalsState>(builder: (context, state) {
      if(state is GoalsSuccess)
      {
        return ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount:state.plans.data!.length,
            itemBuilder: (context, index) {
              return  WhatTrainRow(wObj: state.plans.data![index] );
            });
      }
      if(state is GoalsFailed)
        {
          if(state.obj != Null)
         { return ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount:state.obj.data!.length,
              itemBuilder: (context, index) {
                return  WhatTrainRow(wObj: state.obj.data![index] );
              });}
          else{
            return NoInternetNoCachWedgit(ontap: (){
           BlocProvider.of<GoalsBloc>(context).add(GoalsEvent());
            });
        }
        }
        return const GoalesItemShimmerLoading();
    }, listener: (BuildContext context1, GoalsState state) {
       if (state is GoalsFailed)
      {
        showErrorDialogMesseage( context1: context1, state:  state.errorMessage, ontaptry:(){
          BlocProvider<GoalsBloc>.value(
            value: BlocProvider.of<GoalsBloc>(context1)..add(GoalsEvent()),
          );
          GoRouter.of(context).pop();
          // print('object');
        }, ontapcancel: (){  GoRouter.of(context).pop();},);
      }
    },);
  }
}