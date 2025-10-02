import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/common_widget/Custom_app_button.dart';
import 'package:fitness/common_widget/custtom_app_title.dart';
import 'package:fitness/common_widget/round_button.dart';
import 'package:fitness/common_widget/app_body_topper_dash.dart';
import 'package:fitness/features/food/presintation/veiwes/wedgits/carbohidrate_wedgit.dart';
import 'package:fitness/features/food/presintation/veiwes/wedgits/ingredients_section.dart';
import 'package:fitness/features/food/presintation/veiwes/wedgits/recipy_steps_setion.dart';
import 'package:fitness/features/food/presintation/views%20bloc/food%20bascket/food_pascket_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';

import '../../../../common/api_servieses.dart';
import '../../../../common/common blocs/languge blocs/languge_bloc.dart';
import '../../../../common/localization/applocalizations.dart';
import '../../../../common/styles.dart';
import '../../../../common_widget/custtom_circle_dash_count_widget.dart';
import '../../../../common_widget/custtom_detailes_wedgit.dart';
import '../../../../common_widget/food_step_detail_row.dart';
import '../../../../common_widget/no_internet_no_cache_Widget.dart';
import '../../../../utls/functions/build_app_app_bar.dart';
import '../../../home/presintation/views/widgets/custtom_app_bar.dart';
import '../../../../common_widget/custtom_read_more_descriptons.dart';
import '../../../workout_tracker/presintation/weggits/exercies detailes wedgites/exercies_detailes_how_to_do_it_wedgit.dart';
import '../../../workout_tracker/presintation/weggits/workout_detailes_view_app_bar.dart';
import '../../data/models/meal_detailes.dart';
import '../views bloc/bascket add/bascket_add_bloc.dart';
import '../views bloc/meal bloc/meal_bloc.dart';
import 'loading pagess/food_info_detailes_shimmer_loading.dart';

class FoodInfoDetailsView extends StatefulWidget {
  final int index;
  const FoodInfoDetailsView({super.key, required this.index});

  @override
  State<FoodInfoDetailsView> createState() => _FoodInfoDetailsViewState();
}

class _FoodInfoDetailsViewState extends State<FoodInfoDetailsView> {
  List ingredientsArr = [
    {
      "image": "assets/img/flour.png",
      "title": "Wheat Flour",
      "value": "100grm"
    },
    {"image": "assets/img/sugar.png", "title": "Sugar", "value": "3 tbsp"},
    {
      "image": "assets/img/baking_soda.png",
      "title": "Baking Soda",
      "value": "2tsp"
    },
    {"image": "assets/img/eggs.png", "title": "Eggs", "value": "2 items"},
  ];

  List stepArr = [
    "Prepare all of the ingredients that needed",
    "Mix flour, sugar, salt, and baking powder",
    "In a seperate place, mix the eggs and liquid milk until blended",
    "Put the egg and milk mixture into the dry ingredients, Stir untul smooth and smooth",
    "Prepare all of the ingredients that needed"
  ];
  List findEatArr = [
    {
      "name": "Breakfast",
      "image": "assets/img/m_3.png",
      "number": "120+ Foods"
    },
    {"name": "Lunch", "image": "assets/img/m_4.png", "number": "130+ Foods"},
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealBloc, MealState>(
      builder: (context, state) {
        if (state is GetMealDetailesSuccess) {
          return
            FoodInfoDetailesSuccessWedgit(state: state.mealDetailes);
        } else if (state is GeMealDetailesFailed) {
          if (state.obj != Null) {
            return FoodInfoDetailesSuccessWedgit(
              state: state.obj,
            );
          } else {
            return Center(child: NoInternetNoCachWedgit(
              ontap: () {
                BlocProvider<MealBloc>.value(
                  value: BlocProvider.of<MealBloc>(context)
                    ..add(GetAllMealesEvent(1, 0, 0, 0)),
                );
              },
            ));
          }
        }
        return
          FoodInfoDetailsViewShimmerLoading();

      },
    );
  }
}

class FoodInfoDetailesSuccessWedgit extends StatelessWidget {
  final MealDetailes state;
  FoodInfoDetailesSuccessWedgit({super.key, required this.state});
  List stepArr = [
    "Prepare all of the ingredients that needed",
    "Mix flour, sugar, salt, and baking powder",
    "In a seperate place, mix the eggs and liquid milk until blended",
    "Put the egg and milk mixture into the dry ingredients, Stir untul smooth and smooth",
    "Prepare all of the ingredients that needed"
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return BlocBuilder<LangugeBloc, LangugeState>(
  builder: (context, langstate) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: TColor.primaryG)),
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return workOutDetilesViewAppBar(
              media,
              '$imageBaseUrl${state.data!.media![0].originalUrl!.split('8000/').last}',
              langstate.locale == Locale('ar')? state.data!.titleAr!:state.data!.title!
             );
        },
        body: Container(
          decoration: BoxDecoration(
              color: TColor.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const AppBodyTopperDash(),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: CusttomDetailesWedgit(
                            title:  langstate.locale == Locale('ar')? state.data!.titleAr!:state.data!.title!, SubTitle: state.data!.calories!.toString()),
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                    CarbohidrateWedgit(list:state),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      CusttomAppTitle(title:
                      "${AppLocalazations.of(context)!.translate("ExercisesPage")["Descriptions"]}"),
                      const SizedBox(
                        height: 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child:  CusttomReadMorDescription(
                      test:langstate.locale == Locale('ar')? state.data!.descriptionAr!:state.data!.description!
          )
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      IngredientsSection(
                        media: media,
                        ingredientsArr: state.data!.ingredients!,
                      ),
                      // const SizedBox(
                      //   height: 15,
                      // ),
                      // RecipyStepsSetion(
                      //   stepArr: [langstate.locale == Locale('ar')? state.data!.prepareAr: state.data!.prepare],
                      // ),
                      // SizedBox(
                      //   height: media.width * 0.25,
                      // ),
                    ],
                  ),
                ),
                SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: CusttomAppButton(
                          title: langstate.locale == Locale('ar')
                              ? " ضف إلى قائمة وجباتي "
                              : "Add Meal to My Cart",
                          onPressed: () {
                            BlocProvider.of<BascketAddBloc>(context).add(BascketAddItemEvent(state));
                          },
                        )
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  },
);
  }
}
