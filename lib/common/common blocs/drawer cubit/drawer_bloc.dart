import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
part 'drawer_event.dart';
part 'drawer_state.dart';

class DrawerBloc extends Bloc<DrawerEvent, DrawerState> {
  DrawerBloc() : super(Drawerinit()){

    on<DrawerEvent>((event, emit) async {
     late double Scaleposition ;
     late double position ;
     double i=0, j=1;

      for(int k=0;k<100;k++)
        {
          await Future.delayed(const Duration(milliseconds: 1));
          position = Curves.fastOutSlowIn.transform(i);
          i+=0.01;
        // await Future.delayed(const Duration(milliseconds: 20));
        Scaleposition = Curves.fastOutSlowIn.transform(j);
        j-=0.01;
        print(position);
        emit(DrawerStateChanged(position,Scaleposition,true));
        if(j<=0.4 ||i >=1) {
          break;
        }
        }

    });
    on<DrawerBackEvent>((event, emit) async {
      late double Scaleposition ;
      late double position ;
      double i=0, j=1;

      for(int k=0;k<100;k++)
      {
        await Future.delayed(const Duration(milliseconds: 1));
        position = Curves.fastOutSlowIn.transform(i);
        i+=0.01;
        // await Future.delayed(const Duration(milliseconds: 20));
        Scaleposition = Curves.fastOutSlowIn.transform(j);
        j-=0.01;
        print(position);
        emit(DrawerStateChanged(position,Scaleposition,true));
        if(j<=0.4 ||i >=1) {
          break;
        }
      }
    });
  }
  }
