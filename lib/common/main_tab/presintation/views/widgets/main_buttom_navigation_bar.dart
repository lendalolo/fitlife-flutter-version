import 'package:fitness/common/main_tab/presintation/views/widgets/pages_list.dart';
import 'package:fitness/features/home/presintation/veiws%20bloc/profile%20statistc%20bloc/profile_statistics_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'tab_button.dart';
import '../../../../colo_extension.dart';
import '../../views bloc/buttom_navigation_bar_bloc.dart';

class MainButtomNavigationBar extends StatelessWidget {
  final ButtomNavigationBarState state;
  const MainButtomNavigationBar({
    super.key, required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        child: Container(
          decoration: BoxDecoration(color: TColor.white, boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, -2))
          ]),
          height: kToolbarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: navigationButtomPagesList.map((e) =>Row(
              children: [
                TabButton(
                    icon: e.icon,
                    selectIcon: e.activeIcon,
                    isActive: state.pageIndex == e.number,
                    onTap: () {
                      BlocProvider.of<ButtomNavigationBarBloc>(context).add(ButtomNavigationBarEvent(pageIndex: e.number));

                    }),
                e.number==1? const SizedBox(width: 50,):const SizedBox()
              ],
            ), ).toList(),
          ),
        ));
  }
}