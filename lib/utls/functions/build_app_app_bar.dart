import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../common/colo_extension.dart';
import '../../common/common blocs/languge blocs/languge_bloc.dart';
import '../../features/home/presintation/views/widgets/custtom_app_bar_icon_wedgit.dart';


AppBar buildAppAppBar(BuildContext context, String name ,String enName) {
  return AppBar(
    title: BlocBuilder<LangugeBloc, LangugeState>(
      builder: (context, state) {
        return state.locale ==const Locale('ar')?Text(enName):Text(name);
      },
    ),
    backgroundColor: TColor.white,
    centerTitle: true,
    elevation: 0,
    leading: CusttomAppBarIconWedgir(ontap: () {
      GoRouter.of(context).pop();
    },
      child: const Icon(Icons.arrow_back_ios_rounded, size: 15,),),
    actions: [
      CusttomAppBarIconWedgir(ontap: () {},
        child: const Icon(Icons.more_horiz, size: 15),)
    ],
  );
}