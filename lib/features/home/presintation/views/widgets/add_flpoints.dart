
import 'package:fl_chart/fl_chart.dart';

List<FlSpot> addFlSpots (List<double> x, List<double> y){
  List<FlSpot> list =[];
  for(int i=0;i< x.length;i++) {
    list.add( FlSpot(x[i], y[i]));
  }
  return list;
}