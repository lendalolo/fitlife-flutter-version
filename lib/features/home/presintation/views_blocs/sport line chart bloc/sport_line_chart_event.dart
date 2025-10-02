part of 'sport_line_chart_bloc.dart';

class SportLineChartEvent {
  final int spotIndex;
  SportLineChartEvent(this.spotIndex);
}
class FoodProgressChartEvent extends SportLineChartEvent {
  FoodProgressChartEvent(super.spotIndex);

}
class ExcerciesProgressChartEvent extends SportLineChartEvent {
  ExcerciesProgressChartEvent(super.spotIndex);

}