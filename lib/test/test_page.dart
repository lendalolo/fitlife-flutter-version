import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/common/common%20blocs/languge%20blocs/languge_bloc.dart';
import 'package:fitness/common_widget/Loading_page.dart';
import 'package:fitness/features/auth/presintation/views%20blocs/Auth%20bloc/auth_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../common/common blocs/drawer cubit/drawer_bloc.dart';
import '../common/utls/name_class.dart';
import '../common_widget/bottom_snackbar_message.dart';
import 'drawerScreen.dart';
import 'homeScreen.dart';

class DrawerPage extends StatefulWidget {
  final Animation<double> animation;
  final Animation<double> scalanimation;
  final Widget page;
  DrawerPage(this.page, this.animation, this.scalanimation);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> with TickerProviderStateMixin{
  // late AnimationController animationController;
  // late Animation<double> animation;
  // late Animation<double> scalanimation;
  @override
  initState()  {
    super.initState();
    // animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 200))..addListener(() {
    //   setState(() {
    //
    //   });
    //  // BlocProvider.of<DrawerBloc>(context).add(DrawerEvent());
    // });
    // animation = Tween<double>(begin: 0,end: 1).animate(CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn));
    // scalanimation = Tween<double>(begin: 1,end: 0.8).animate(CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn));
    // print('kkk');
  }
  @override
  void dispose() {
   // animationController.dispose();
    super.dispose();
  }
bool isSideParClosed =true;
  @override
  Widget build(BuildContext context) {
  return  Scaffold(
    body: BlocConsumer<AuthBloc,AuthState>(builder: (context, state) {
      if(state is LogOutLoading)
        {
          return const LoadingPage();
        }

      return DrawerSuccessWidget(widget: widget);
      }, listener: (context, state) {
        if(state is LogOutSuccess)
          {
            GoRouter.of(context).goNamed(Names.SelectView);
          }
        else if(state is LogOutFailed )
          {
          return  bottomSnackbarMassage(  context: context, message:state.error,);
          }
      },),
  );

  }
}

class DrawerSuccessWidget extends StatelessWidget {
  const DrawerSuccessWidget({
    super.key,
    required this.widget,
  });

  final DrawerPage widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.primaryColor1,
      body: BlocBuilder<DrawerBloc, DrawerState>(
       builder: (context, state) {
         if(state is DrawerStateChanged) {
           print(state.position);
           return Stack(
           children: [
          AnimatedPositioned(
            width: 288,
            height: MediaQuery.of(context).size.height,
            duration: const Duration(milliseconds: 200),
            left:state.position ,
            curve: Curves.bounceIn,
            child: DrawerScreen(),
          ),
             //AnimatedContainer(duration:Duration(milliseconds: 200) ,transformAlignment: Alignment.bottomLeft,transform: Matrix4.,)
          Transform.translate(
              offset: Offset( state.position*250, 0),
              child: Transform.scale(
                scale:state.scaleposition,
                child: ClipRRect(borderRadius: state.isOppened?
                BorderRadius.circular(40):BorderRadius.circular(0),child: widget.page),
              ))
        ],
      );
         }
         return widget.page;
      },
    ),
    );
  }
}
