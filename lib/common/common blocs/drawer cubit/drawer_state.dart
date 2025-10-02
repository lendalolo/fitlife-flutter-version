
part of 'drawer_bloc.dart';
class DrawerState {
}

class Drawerinit extends DrawerState{}
class DrawerStateChanged extends DrawerState{
  final double position;
  final double scaleposition;
  final bool isOppened;
  DrawerStateChanged(this.position, this.scaleposition, this.isOppened);
}