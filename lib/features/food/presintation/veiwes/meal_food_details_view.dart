import 'package:fitness/common_widget/custtom_app_title.dart';
import 'package:fitness/features/food/presintation/veiwes/wedgits/food_list_for_particular_type.dart';
import 'package:fitness/features/food/presintation/veiwes/wedgits/app_bar_for_app_bar_property.dart';
import 'package:fitness/features/food/presintation/veiwes/wedgits/food_categores_wedgit.dart';
import 'package:fitness/features/food/presintation/veiwes/wedgits/new_recipes_wedgit.dart';
import 'package:fitness/features/food/presintation/views%20bloc/food%20search%20bloc/food_search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/localization/applocalizations.dart';
import '../../../../common_widget/custtom_search_text_feild.dart';
import '../../../../common_widget/no_internet_no_cache_Widget.dart';
import '../views bloc/categores bloc/categories_bloc.dart';
import '../views bloc/catigory list bloc/catirgory_list_bloc.dart';
import '../views bloc/food bascket/food_pascket_bloc.dart';
import '../views bloc/meal bloc/meal_bloc.dart';
import 'loading pagess/MealsListViewShimmerDownLoading.dart';
import 'loading pagess/food_catrgirriesWedgitShimmerLoading.dart';
import 'loading pagess/new_recipes_wedgit_shimmer_loading.dart';
import 'package:fitness/features/food/data/models/all_meals.dart';

class MealFoodDetailsView extends StatefulWidget {
  final Map eObj;
  const MealFoodDetailsView({super.key, required this.eObj});

  @override
  State<MealFoodDetailsView> createState() => _MealFoodDetailsViewState();
}

class _MealFoodDetailsViewState extends State<MealFoodDetailsView> {
  TextEditingController txtSearch = TextEditingController();

  List categoryArr = [
    {
      "name": "Salad",
      "image": "assets/img/c_1.png",
    },
    {
      "name": "Cake",
      "image": "assets/img/c_2.png",
    },
    {
      "name": "Pie",
      "image": "assets/img/c_3.png",
    },
    {
      "name": "Smoothies",
      "image": "assets/img/c_4.png",
    },
    {
      "name": "Salad",
      "image": "assets/img/c_1.png",
    },
    {
      "name": "Cake",
      "image": "assets/img/c_2.png",
    },
    {
      "name": "Pie",
      "image": "assets/img/c_3.png",
    },
    {
      "name": "Smoothies",
      "image": "assets/img/c_4.png",
    },
  ];

  List popularArr = [
    {
      "name": "Blueberry Pancake",
      "image": "assets/img/f_1.png",
      "b_image": "assets/img/pancake_1.png",
      "size": "Medium",
      "time": "30mins",
      "kcal": "230kCal"
    },
    {
      "name": "Salmon Nigiri",
      "image": "assets/img/f_2.png",
      "b_image": "assets/img/nigiri.png",
      "size": "Medium",
      "time": "20mins",
      "kcal": "120kCal"
    },
  ];

  List recommendArr = [
    {
      "name": "Honey Pancake",
      "image": "assets/img/rd_1.png",
      "size": "Easy",
      "time": "30mins",
      "kcal": "180kCal"
    },
    {
      "name": "Canai Bread",
      "image": "assets/img/m_4.png",
      "size": "Easy",
      "time": "20mins",
      "kcal": "230kCal"
    },
  ];

  List<int> catego = [];
  List<Meal> sortedList = [];
  @override
  initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CusttomAppBarForAppBarProberty(
          context: context, title: widget.eObj['name']),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CusttomSearchTextFeild(
            //   txtSearch: txtSearch,
            //   SearshTestHint: AppLocalazations.of(context)!
            //       .translate("Meals Planer")['Search Pancake'],
            //   dropDownListItems: ['recipe name', 'calories'],
            //   onChanged: (String? value) {
            //     BlocProvider.of<FoodSearchBloc>(context)
            //         .add(FoodSearchEvent(value!));
            //   },
            // ),
            SizedBox(
              height: media.width * 0.05,
            ),
            BlocConsumer<CategoriesBloc, CategoriesState>(
                listener: (context, state) {},
                builder: (context, state) {
              if (state is GetMealsCategoriesSuccess) {
                return FoodCategoresWidget(
                    categoryArr: state.mealCategories, sortedList: sortedList);
              } else if (state is GeMealsCategoriesFailed) {
                if (state.obj != Null) {
                  return FoodCategoresWidget(
                    categoryArr: state.obj,
                    sortedList: sortedList,
                  );
                } else {
                  return SizedBox();
                }
              }
              return FoodCategoresWidgetShimmerLoading();
            }),
            SizedBox(
              height: media.width * 0.05,
            ),
            BlocConsumer<MealBloc, MealState>(
              builder: (context, state) {
                if (state is GetAllMealsSuccess) {
                  return BlocBuilder<CatirgoryListBloc, CatirgoryListState>(
                    builder: (context, mystate) {
                      if( mystate is CatirgoryListchanged) {
                        return FoodListForParticularType(
                            media: media,
                            recommendArr: recommendArr,
                            state: mystate.endsortedLis1t);
                      }
                      if( mystate is CatirgoryListInitial) {
                        return FoodListForParticularType(
                            media: media,
                            recommendArr: recommendArr,
                            state: sortedList);
                      }
                      return SizedBox();
                    },
                  );
                } else if (state is GetAllMealsFailed) {
                  if (state.obj != Null) {
                    return FoodListForParticularType(
                      media: media,
                      recommendArr: recommendArr,
                      state: state.obj.data[0].meal,
                    );
                  }
                  else {
                    return SizedBox();
                  }
                }
                return MealsListViewShimmerLoading(
                  media: media,
                  recommendArr: recommendArr,
                );
              },
              listener: (context, state) {
                if (state is GetAllMealsSuccess) {
                  sortedList.addAll(state.allMyMeals.data![0].meal!);
                }
                if (state is GetAllMealsFailed) {
                  if(state.obj != Null) {
                    sortedList.addAll(state.obj.data![0].meal!);
                  }
                }
              },
            ),
            SizedBox(
              height: media.width * 0.05,
            ),
            CusttomAppTitle(
                title: AppLocalazations.of(context)!
                    .translate("Meals Planer")['new recipes']),
            BlocBuilder<MealBloc, MealState>(
              builder: (context, state) {
                if (state is GetAllMealsSuccess) {
                  return NewRecipesWedgit(
                      popularArr: state.allMyMeals.data![0].lastedMeal!);
                } else if (state is GetAllMealsFailed) {
                  if (state.obj != Null) {
                    return NewRecipesWedgit(
                        popularArr: state.obj.data![0].lastedMeal!);
                  } else {
                    return Center(child: NoInternetNoCachWedgit(
                      ontap: () {
                        BlocProvider<MealBloc>.value(
                          value: BlocProvider.of<MealBloc>(context)
                            ..add(GetAllMealesEvent(1, 0, 0, 0)),
                        );
                        BlocProvider<CategoriesBloc>.value(
                          value: BlocProvider.of<CategoriesBloc>(context)
                            ..add(CategoriesEvent()),
                        );
                      },
                    ));
                  }
                }
                return NewRecipesWedgitShimmerLoading();
              },
            ),
            SizedBox(
              height: media.width * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
