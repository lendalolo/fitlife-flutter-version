import 'package:fitness/features/food/data/models/all_meals.dart';
import 'package:fitness/features/food/presintation/views%20bloc/catigory%20list%20bloc/catirgory_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../common/colo_extension.dart';
import '../../../../../common/localization/applocalizations.dart';
import '../../../../../common_widget/custtom_app_title.dart';
import '../../../data/models/meal_categories.dart';
import 'meal_category_cell.dart';
class FoodCategoresWidget extends StatelessWidget {
  const FoodCategoresWidget({
    super.key,
    required this.categoryArr, required this.sortedList,
  });

  final MealCategories categoryArr;
  final List<Meal> sortedList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CusttomAppTitle(title:  AppLocalazations.of(context)!
                .translate("Meals Planer")["Category"],),
            IconButton(onPressed: () {
              BlocProvider.of<CatirgoryListBloc>(context).add(CatirgoryRestListEvent());

            }, icon: Icon(Icons.all_inclusive,color: TColor.primaryColor2,))
          ],
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              scrollDirection: Axis.horizontal,
              itemCount: categoryArr.data!.length,
              itemBuilder: (context, index) {
                List category = [
                  {
                    "name": "Salad",
                    "image": "assets/img/chicken.png",
                  },
                  {
                    "name": "Cake",
                    "image": "assets/img/c_2.png",
                  },
                  {
                    "name": "Pie",
                    "image": "assets/img/coffee.png",
                  //  "image": "assets/img/c_3.png",
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
                return GestureDetector(child:MealCategoryCell(
                  image:category[index]['image'],
                  cObj: categoryArr.data![index],
                  index: index,
                ),onTap: () {
                  BlocProvider.of<CatirgoryListBloc>(context).add(CatirgoryListEvent(sortedList, categoryArr.data![index].id!));
                //
                },);
              }),
        ),
      ],
    );
  }
}
