part of 'bascket_add_bloc.dart';

// adjust this path
class BascketAddInitial extends Equatable {
 final List<MealDetailes> items;

 final List<MealDetailes> breakfastArrNotSended;
 final List<MealDetailes> lunchArrNotSended;
 final List<MealDetailes> snacksArrNotSended;
 final List<MealDetailes> dinnerArrNotSended;

 final int caloriesCount;
 final int protiensCount;
 final int fatesCount;
 final int caeboCount;

 final int caloriesCountLnche;
 final int protiensCountLnche;
 final int fatesCountLnche;
 final int caeboCountLnche;

 final int caloriesCountDinner;
 final int protiensCountDinner;
 final int fatesCountDinner;
 final int caeboCountDinner;

 final int caloriesCountSnack;
 final int protiensCountSnack;
 final int fatesCountSnack;
 final int caeboCountSnack;

 final int caloriesCountBeackfast;
 final int protiensCountBeackfast;
 final int fatesCountBeackfast;
 final int caeboCountBeackfast;

 final List<int> caloriesList;
 final List<int> checkList;

 BascketAddInitial({
  this.items = const [],
  this.breakfastArrNotSended = const [],
  this.lunchArrNotSended = const [],
  this.snacksArrNotSended = const [],
  this.dinnerArrNotSended = const [],
  this.caloriesCount = 0,
  this.protiensCount = 0,
  this.fatesCount = 0,
  this.caeboCount = 0,
  this.caloriesCountLnche = 0,
  this.protiensCountLnche = 0,
  this.fatesCountLnche = 0,
  this.caeboCountLnche = 0,
  this.caloriesCountDinner = 0,
  this.protiensCountDinner = 0,
  this.fatesCountDinner = 0,
  this.caeboCountDinner = 0,
  this.caloriesCountSnack = 0,
  this.protiensCountSnack = 0,
  this.fatesCountSnack = 0,
  this.caeboCountSnack = 0,
  this.caloriesCountBeackfast = 0,
  this.protiensCountBeackfast = 0,
  this.fatesCountBeackfast = 0,
  this.caeboCountBeackfast = 0,
  this.caloriesList = const [],
  this.checkList = const [],
 });

 BascketAddInitial copyWith({
  List<MealDetailes>? items,
  List<MealDetailes>? breakfastArrNotSended,
  List<MealDetailes>? lunchArrNotSended,
  List<MealDetailes>? snacksArrNotSended,
  List<MealDetailes>? dinnerArrNotSended,
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
  List<int>? caloriesList,
  List<int>? checkList,
 }) {
  return BascketAddInitial(
   items: items ?? this.items,
   breakfastArrNotSended: breakfastArrNotSended ?? this.breakfastArrNotSended,
   lunchArrNotSended: lunchArrNotSended ?? this.lunchArrNotSended,
   snacksArrNotSended: snacksArrNotSended ?? this.snacksArrNotSended,
   dinnerArrNotSended: dinnerArrNotSended ?? this.dinnerArrNotSended,
   caloriesCount: caloriesCount ?? this.caloriesCount,
   protiensCount: protiensCount ?? this.protiensCount,
   fatesCount: fatesCount ?? this.fatesCount,
   caeboCount: caeboCount ?? this.caeboCount,
   caloriesCountLnche: caloriesCountLnche ?? this.caloriesCountLnche,
   protiensCountLnche: protiensCountLnche ?? this.protiensCountLnche,
   fatesCountLnche: fatesCountLnche ?? this.fatesCountLnche,
   caeboCountLnche: caeboCountLnche ?? this.caeboCountLnche,
   caloriesCountDinner: caloriesCountDinner ?? this.caloriesCountDinner,
   protiensCountDinner: protiensCountDinner ?? this.protiensCountDinner,
   fatesCountDinner: fatesCountDinner ?? this.fatesCountDinner,
   caeboCountDinner: caeboCountDinner ?? this.caeboCountDinner,
   caloriesCountSnack: caloriesCountSnack ?? this.caloriesCountSnack,
   protiensCountSnack: protiensCountSnack ?? this.protiensCountSnack,
   fatesCountSnack: fatesCountSnack ?? this.fatesCountSnack,
   caeboCountSnack: caeboCountSnack ?? this.caeboCountSnack,
   caloriesCountBeackfast: caloriesCountBeackfast ?? this.caloriesCountBeackfast,
   protiensCountBeackfast: protiensCountBeackfast ?? this.protiensCountBeackfast,
   fatesCountBeackfast: fatesCountBeackfast ?? this.fatesCountBeackfast,
   caeboCountBeackfast: caeboCountBeackfast ?? this.caeboCountBeackfast,
   caloriesList: caloriesList ?? this.caloriesList,
   checkList: checkList ?? this.checkList,
  );
 }

 @override
 List<Object> get props => [
  items,
  breakfastArrNotSended,
  lunchArrNotSended,
  snacksArrNotSended,
  dinnerArrNotSended,
  caloriesCount,
  protiensCount,
  fatesCount,
  caeboCount,
  caloriesCountLnche,
  protiensCountLnche,
  fatesCountLnche,
  caeboCountLnche,
  caloriesCountDinner,
  protiensCountDinner,
  fatesCountDinner,
  caeboCountDinner,
  caloriesCountSnack,
  protiensCountSnack,
  fatesCountSnack,
  caeboCountSnack,
  caloriesCountBeackfast,
  protiensCountBeackfast,
  fatesCountBeackfast,
  caeboCountBeackfast,
  caloriesList,
  checkList,
 ];
}

// class BascketAddInitial extends Equatable {
//  final List<MealDetailes> items;
//
//  final List<MealDetailes> breakfastArrNotSended;
//  final List<MealDetailes> lunchArrNotSended;
//  final List<MealDetailes> snacksArrNotSended;
//  final List<MealDetailes> dinnerArrNotSended;
//
//  final int caloriesCount;
//  final int protiensCount;
//  final int fatesCount;
//  final int caeboCount;
//
//  final int caloriesCountLnche;
//  final int protiensCountLnche;
//  final int fatesCountLnche;
//  final int caeboCountLnche;
//
//  final int caloriesCountDinner;
//  final int protiensCountDinner;
//  final int fatesCountDinner;
//  final int caeboCountDinner;
//
//  final int caloriesCountSnack;
//  final int protiensCountSnack;
//  final int fatesCountSnack;
//  final int caeboCountSnack;
//
//  final int caloriesCountBeackfast;
//  final int protiensCountBeackfast;
//  final int fatesCountBeackfast;
//  final int caeboCountBeackfast;
//
//  BascketAddInitial({
//   this.items = const [],
//   this.breakfastArrNotSended = const [],
//   this.lunchArrNotSended = const [],
//   this.snacksArrNotSended = const [],
//   this.dinnerArrNotSended = const [],
//   this.caloriesCount = 0,
//   this.protiensCount = 0,
//   this.fatesCount = 0,
//   this.caeboCount = 0,
//   this.caloriesCountLnche = 0,
//   this.protiensCountLnche = 0,
//   this.fatesCountLnche = 0,
//   this.caeboCountLnche = 0,
//   this.caloriesCountDinner = 0,
//   this.protiensCountDinner = 0,
//   this.fatesCountDinner = 0,
//   this.caeboCountDinner = 0,
//   this.caloriesCountSnack = 0,
//   this.protiensCountSnack = 0,
//   this.fatesCountSnack = 0,
//   this.caeboCountSnack = 0,
//   this.caloriesCountBeackfast = 0,
//   this.protiensCountBeackfast = 0,
//   this.fatesCountBeackfast = 0,
//   this.caeboCountBeackfast = 0,
//  });
//
//  BascketAddInitial copyWith({
//   List<MealDetailes>? items,
//   List<MealDetailes>? breakfastArrNotSended,
//   List<MealDetailes>? lunchArrNotSended,
//   List<MealDetailes>? snacksArrNotSended,
//   List<MealDetailes>? dinnerArrNotSended,
//   int? caloriesCount,
//   int? protiensCount,
//   int? fatesCount,
//   int? caeboCount,
//   int? caloriesCountLnche,
//   int? protiensCountLnche,
//   int? fatesCountLnche,
//   int? caeboCountLnche,
//   int? caloriesCountDinner,
//   int? protiensCountDinner,
//   int? fatesCountDinner,
//   int? caeboCountDinner,
//   int? caloriesCountSnack,
//   int? protiensCountSnack,
//   int? fatesCountSnack,
//   int? caeboCountSnack,
//   int? caloriesCountBeackfast,
//   int? protiensCountBeackfast,
//   int? fatesCountBeackfast,
//   int? caeboCountBeackfast,
//  }) {
//   return BascketAddInitial(
//    items: items ?? this.items,
//    breakfastArrNotSended: breakfastArrNotSended ?? this.breakfastArrNotSended,
//    lunchArrNotSended: lunchArrNotSended ?? this.lunchArrNotSended,
//    snacksArrNotSended: snacksArrNotSended ?? this.snacksArrNotSended,
//    dinnerArrNotSended: dinnerArrNotSended ?? this.dinnerArrNotSended,
//    caloriesCount: caloriesCount ?? this.caloriesCount,
//    protiensCount: protiensCount ?? this.protiensCount,
//    fatesCount: fatesCount ?? this.fatesCount,
//    caeboCount: caeboCount ?? this.caeboCount,
//    caloriesCountLnche: caloriesCountLnche ?? this.caloriesCountLnche,
//    protiensCountLnche: protiensCountLnche ?? this.protiensCountLnche,
//    fatesCountLnche: fatesCountLnche ?? this.fatesCountLnche,
//    caeboCountLnche: caeboCountLnche ?? this.caeboCountLnche,
//    caloriesCountDinner: caloriesCountDinner ?? this.caloriesCountDinner,
//    protiensCountDinner: protiensCountDinner ?? this.protiensCountDinner,
//    fatesCountDinner: fatesCountDinner ?? this.fatesCountDinner,
//    caeboCountDinner: caeboCountDinner ?? this.caeboCountDinner,
//    caloriesCountSnack: caloriesCountSnack ?? this.caloriesCountSnack,
//    protiensCountSnack: protiensCountSnack ?? this.protiensCountSnack,
//    fatesCountSnack: fatesCountSnack ?? this.fatesCountSnack,
//    caeboCountSnack: caeboCountSnack ?? this.caeboCountSnack,
//    caloriesCountBeackfast: caloriesCountBeackfast ?? this.caloriesCountBeackfast,
//    protiensCountBeackfast: protiensCountBeackfast ?? this.protiensCountBeackfast,
//    fatesCountBeackfast: fatesCountBeackfast ?? this.fatesCountBeackfast,
//    caeboCountBeackfast: caeboCountBeackfast ?? this.caeboCountBeackfast,
//   );
//  }
//
//  @override
//  List<Object> get props => [
//   items,
//   breakfastArrNotSended,
//   lunchArrNotSended,
//   snacksArrNotSended,
//   dinnerArrNotSended,
//   caloriesCount,
//   protiensCount,
//   fatesCount,
//   caeboCount,
//   caloriesCountLnche,
//   protiensCountLnche,
//   fatesCountLnche,
//   caeboCountLnche,
//   caloriesCountDinner,
//   protiensCountDinner,
//   fatesCountDinner,
//   caeboCountDinner,
//   caloriesCountSnack,
//   protiensCountSnack,
//   fatesCountSnack,
//   caeboCountSnack,
//   caloriesCountBeackfast,
//   protiensCountBeackfast,
//   fatesCountBeackfast,
//   caeboCountBeackfast,
//  ];
// }

