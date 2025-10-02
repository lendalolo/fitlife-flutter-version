import 'package:flutter_bloc/flutter_bloc.dart';

class Observer extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
   print(transition);
  }
}