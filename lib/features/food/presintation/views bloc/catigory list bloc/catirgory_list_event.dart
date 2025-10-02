part of 'catirgory_list_bloc.dart';
class CatListEvints{}
class CatirgoryListEvent extends CatListEvints{
  final List<Meal> sortedList;
  final int catId;
  CatirgoryListEvent(this.sortedList, this.catId);
}
class CatirgoryRestListEvent extends CatListEvints{
}

