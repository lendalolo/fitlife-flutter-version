import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../common/localization/applocalizations.dart';
import 'on_boarding_page.dart';
import '../../../../../utls/constants/on_boarding_list.dart';
import '../../views_bloc/change_page_bloc/change_page_bloc.dart';
class PagesList extends StatelessWidget {
  const PagesList({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePageBloc, ChangePage>(builder: (context, state) {
      return PageView.builder(
          onPageChanged: (value) {
            BlocProvider.of<ChangePageBloc>(context).add(
                ChangePageEvent());
            state.index = value;
          },

          controller: controller,
          itemCount: AppLocalazations.of(context)!.translate('OnBoardingPage').length,
          itemBuilder: (context, index) {
            var pObj = AppLocalazations.of(context)!.translate('OnBoardingPage')[index] ;
            return OnBoardingPage(pObj: pObj);
          });
    },);
  }
}