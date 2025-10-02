import 'package:fitness/common/common%20blocs/drawer%20cubit/drawer_bloc.dart';
import 'package:fitness/features/auth/presintation/views%20blocs/Auth%20bloc/auth_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../common/colo_extension.dart';
import 'configuration.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: TColor.primaryColor1,
      padding: const EdgeInsets.only(top:50,bottom: 70,left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(),
              const SizedBox(width: 10,),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Miroslava Savitskaya',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  Text('Active Status',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))
                ],
              ),
              IconButton(onPressed: (){
                BlocProvider.of<DrawerBloc>(context).add(DrawerBackEvent());
              }, icon: Icon(Icons.close))
              //BlocProvider.of<DrawerBloc>(context).add(DrawerEvent(true));
            ],
          ),
          Column(
            children: drawerItems.map((element) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(element['icon'],color: Colors.white,size: 30,),
                  SizedBox(width: 10,),
                  Text(element['title'],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))
                ],

              ),
            )).toList(),
          ),
          Row(
            children: [
              Icon(Icons.settings,color: Colors.white,),
              SizedBox(width: 10,),
              Text('Settings',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              SizedBox(width: 10,),
              Container(width: 2,height: 20,color: Colors.white,),
              SizedBox(width: 10,),
              GestureDetector(onTap: () {
                BlocProvider.of<AuthBloc>(context).add(LogOut());
              },child: Text('Log out',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))


            ],

          )
        ],
      ),
    );
  }
}
