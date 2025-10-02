import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../common/utls/name_class.dart';
import '../../views_bloc/change_page_bloc/change_page_bloc.dart';
import 'circle_page_indicator.dart';
import 'custom_floating_button.dart';

class NextPageButton extends StatelessWidget {
  final PageController controller;
  const NextPageButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const BottonCircleIndicator(),
        nextPageCircle(),
      ],
    );
  }

  BlocConsumer<ChangePageBloc, ChangePage> nextPageCircle() {
    return BlocConsumer<ChangePageBloc, ChangePage>(
      builder: (context, state) {
        return CustomFloatingBotton(
          ontap: () {
            state.index++;
            BlocProvider.of<ChangePageBloc>(context).add(ChangePageEvent());
          },
          icon: Icons.navigate_next,
        );
      },
      listener: (context, state) {
        if (state.index < 4) {
          animateToNextPage(controller, state);
        } else {
          GoRouter.of(context).pushReplacementNamed(Names.SelectView);
        }
      },
    );
  }

  void animateToNextPage(PageController controller, ChangePage state) {
    controller.animateToPage(state.index,
        duration: const Duration(milliseconds: 600), curve: Curves.linear);
  }
}
