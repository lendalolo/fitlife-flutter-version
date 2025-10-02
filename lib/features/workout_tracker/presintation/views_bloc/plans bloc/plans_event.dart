part of 'plans_bloc.dart';
 abstract class MusclesEvent{}
class PlansEvent extends  MusclesEvent{
  final int num;
  PlansEvent(this.num);
}
class ExerciesEvent extends MusclesEvent{
  final int num;

  ExerciesEvent(this.num,);
}
class ExerciesSubmitEvent extends MusclesEvent{
  final int calories;
  final int check;
  final int planId;
  ExerciesSubmitEvent(this.calories, this.check, this.planId);
}
class GetTodatTargetEvent extends MusclesEvent{
  GetTodatTargetEvent();
}
class GetPlansStaticticsEvent extends MusclesEvent{
  final int planId;
  GetPlansStaticticsEvent(this.planId);
}