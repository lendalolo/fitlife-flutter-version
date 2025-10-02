part of 'food_pascket_bloc.dart';


// class FoodPascketAdded extends FoodPascketState {
//   final List<Meal> items;
//
//   FoodPascketAdded({this.items = const []});
//
//   FoodPascketAdded copyWith({List<Meal>? items}) {
//     return FoodPascketAdded(items: items ?? this.items);
//   }
// }
class FoodPascketGetit {
  final List<Meal> sortedList;
  List<Meal> breakfastArr = [];
  List<Meal> lunchArr = [];
  List<Meal> snacksArr = [];
  List<Meal> dinnerArr = [];

  List<int> checkList = [];
  List<String> category = [];
  List<int> caloriesList = [];

  int caloriesCount = 0;
  int protiensCount = 0;
  int fatesCount = 0;
  int caeboCount = 0;

  int caloriesCountLnche = 0;
  int protiensCountLnche = 0;
  int fatesCountLnche = 0;
  int caeboCountLnche = 0;

  int caloriesCountDinner = 0;
  int protiensCountDinner = 0;
  int fatesCountDinner = 0;
  int caeboCountDinner = 0;

  int caloriesCountSnack = 0;
  int protiensCountSnack = 0;
  int fatesCountSnack = 0;
  int caeboCountSnack = 0;

  int caloriesCountBeackfast = 0;
  int protiensCountBeackfast = 0;
  int fatesCountBeackfast = 0;
  int caeboCountBeackfast = 0;

  FoodPascketGetit(this.sortedList);

  FoodPascketGetit copyWith({
    List<Meal>? sortedList,
    List<Meal>? breakfastArr,
    List<Meal>? lunchArr,
    List<Meal>? snacksArr,
    List<Meal>? dinnerArr,
    List<int>? checkList,
    List<String>? category,
    List<int>? caloriesList,
    int? caloriesCount,
    int? protiensCount,
    int? fatesCount,
    int? caeboCount,
    int? caloriesCountLnche,
    int? protiensCountLnche,
    int? fatesCountLnche,
    int? caeboCountLnche,
    int? caloriesCountDinner,
    int? protiensCountDinner,
    int? fatesCountDinner,
    int? caeboCountDinner,
    int? caloriesCountSnack,
    int? protiensCountSnack,
    int? fatesCountSnack,
    int? caeboCountSnack,
    int? caloriesCountBeackfast,
    int? protiensCountBeackfast,
    int? fatesCountBeackfast,
    int? caeboCountBeackfast,
  }) {
    return FoodPascketGetit(sortedList ?? this.sortedList)
      ..breakfastArr = breakfastArr ?? this.breakfastArr
      ..lunchArr = lunchArr ?? this.lunchArr
      ..snacksArr = snacksArr ?? this.snacksArr
      ..dinnerArr = dinnerArr ?? this.dinnerArr
      ..checkList = checkList ?? this.checkList
      ..category = category ?? this.category
      ..caloriesList = caloriesList ?? this.caloriesList
      ..caloriesCount = caloriesCount ?? this.caloriesCount
      ..protiensCount = protiensCount ?? this.protiensCount
      ..fatesCount = fatesCount ?? this.fatesCount
      ..caeboCount = caeboCount ?? this.caeboCount
      ..caloriesCountLnche = caloriesCountLnche ?? this.caloriesCountLnche
      ..protiensCountLnche = protiensCountLnche ?? this.protiensCountLnche
      ..fatesCountLnche = fatesCountLnche ?? this.fatesCountLnche
      ..caeboCountLnche = caeboCountLnche ?? this.caeboCountLnche
      ..caloriesCountDinner = caloriesCountDinner ?? this.caloriesCountDinner
      ..protiensCountDinner = protiensCountDinner ?? this.protiensCountDinner
      ..fatesCountDinner = fatesCountDinner ?? this.fatesCountDinner
      ..caeboCountDinner = caeboCountDinner ?? this.caeboCountDinner
      ..caloriesCountSnack = caloriesCountSnack ?? this.caloriesCountSnack
      ..protiensCountSnack = protiensCountSnack ?? this.protiensCountSnack
      ..fatesCountSnack = fatesCountSnack ?? this.fatesCountSnack
      ..caeboCountSnack = caeboCountSnack ?? this.caeboCountSnack
      ..caloriesCountBeackfast = caloriesCountBeackfast ?? this.caloriesCountBeackfast
      ..protiensCountBeackfast = protiensCountBeackfast ?? this.protiensCountBeackfast
      ..fatesCountBeackfast = fatesCountBeackfast ?? this.fatesCountBeackfast
      ..caeboCountBeackfast = caeboCountBeackfast ?? this.caeboCountBeackfast;
  }
}

// class FoodPascketGetit  {
//   final List<Meal> sortedList;
//   List<Meal> breakfastArr = [];
//   List<Meal> lunchArr = [];
//   List<Meal> snacksArr = [];
//   List<Meal> dinnerArr = [];
//
//   int caloriesCount =0;
//   int protiensCount =0;
//   int fatesCount =0;
//   int caeboCount =0;
//
//   int caloriesCountLnche =0;
//   int protiensCountLnche =0;
//   int fatesCountLnche =0;
//   int caeboCountLnche =0;
//
//   int caloriesCountDinner =0;
//   int protiensCountDinner =0;
//   int fatesCountDinner =0;
//   int caeboCountDinner =0;
//
//   int caloriesCountSnack =0;
//   int protiensCountSnack =0;
//   int fatesCountSnack =0;
//   int caeboCountSnack =0;
//
//   int caloriesCountBeackfast =0;
//   int protiensCountBeackfast =0;
//   int fatesCountBeackfast =0;
//   int caeboCountBeackfast =0;
//   FoodPascketGetit(this.sortedList);
//   //
//   // FoodPascketGetit copyWith({List<Meal>? sortedList}) {
//   //   return FoodPascketGetit(
//   //     sortedList ?? this.sortedList,
//   //   );
//   // }
//   FoodPascketGetit copyWith({
//     List<Meal>? sortedList,
//     List<Meal>? breakfastArr,
//     List<Meal>? lunchArr,
//     List<Meal>? snacksArr,
//     List<Meal>? dinnerArr,
//     int? caloriesCount,
//     int? protiensCount,
//     int? fatesCount,
//     int? caeboCount,
//     int? caloriesCountLnche,
//     int? protiensCountLnche,
//     int? fatesCountLnche,
//     int? caeboCountLnche,
//     int? caloriesCountDinner,
//     int? protiensCountDinner,
//     int? fatesCountDinner,
//     int? caeboCountDinner,
//     int? caloriesCountSnack,
//     int? protiensCountSnack,
//     int? fatesCountSnack,
//     int? caeboCountSnack,
//     int? caloriesCountBeackfast,
//     int? protiensCountBeackfast,
//     int? fatesCountBeackfast,
//     int? caeboCountBeackfast,
//   }) {
//     return FoodPascketGetit(sortedList ?? this.sortedList)
//       ..breakfastArr = breakfastArr ?? this.breakfastArr
//       ..lunchArr = lunchArr ?? this.lunchArr
//       ..snacksArr = snacksArr ?? this.snacksArr
//       ..dinnerArr = dinnerArr ?? this.dinnerArr
//       ..caloriesCount = caloriesCount ?? this.caloriesCount
//       ..protiensCount = protiensCount ?? this.protiensCount
//       ..fatesCount = fatesCount ?? this.fatesCount
//       ..caeboCount = caeboCount ?? this.caeboCount
//       ..caloriesCountLnche = caloriesCountLnche ?? this.caloriesCountLnche
//       ..protiensCountLnche = protiensCountLnche ?? this.protiensCountLnche
//       ..fatesCountLnche = fatesCountLnche ?? this.fatesCountLnche
//       ..caeboCountLnche = caeboCountLnche ?? this.caeboCountLnche
//       ..caloriesCountDinner = caloriesCountDinner ?? this.caloriesCountDinner
//       ..protiensCountDinner = protiensCountDinner ?? this.protiensCountDinner
//       ..fatesCountDinner = fatesCountDinner ?? this.fatesCountDinner
//       ..caeboCountDinner = caeboCountDinner ?? this.caeboCountDinner
//       ..caloriesCountSnack = caloriesCountSnack ?? this.caloriesCountSnack
//       ..protiensCountSnack = protiensCountSnack ?? this.protiensCountSnack
//       ..fatesCountSnack = fatesCountSnack ?? this.fatesCountSnack
//       ..caeboCountSnack = caeboCountSnack ?? this.caeboCountSnack
//       ..caloriesCountBeackfast = caloriesCountBeackfast ?? this.caloriesCountBeackfast
//       ..protiensCountBeackfast = protiensCountBeackfast ?? this.protiensCountBeackfast
//       ..fatesCountBeackfast = fatesCountBeackfast ?? this.fatesCountBeackfast
//       ..caeboCountBeackfast = caeboCountBeackfast ?? this.caeboCountBeackfast;
//   }
// }

