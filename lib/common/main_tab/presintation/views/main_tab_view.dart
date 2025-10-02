import 'package:fitness/common/main_tab/presintation/views%20bloc/buttom_navigation_bar_bloc.dart';
import 'package:fitness/common/main_tab/presintation/views/widgets/main_buttom_navigation_bar.dart';
import 'package:fitness/common/main_tab/presintation/views/widgets/pages_list.dart';
import 'package:fitness/common/main_tab/presintation/views/widgets/search_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainTabView extends StatelessWidget {
  const MainTabView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtomNavigationBarBloc(),
      child: BlocBuilder<ButtomNavigationBarBloc, ButtomNavigationBarState>(
        builder: (context, state) {
          return Scaffold(
            body: navigationButtomPagesList[state.pageIndex].page,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: const SearchIcon(),
            bottomNavigationBar: MainButtomNavigationBar(
              state: state,
            ),
          );
        },
      ),
    );
  }
}
