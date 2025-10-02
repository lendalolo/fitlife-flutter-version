import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/common_widget/Custom_app_button.dart';
import 'package:fitness/common_widget/custtom_app_title.dart';
import 'package:fitness/common_widget/round_button.dart';
import 'package:fitness/common_widget/app_body_topper_dash.dart';
import 'package:fitness/features/food/presintation/veiwes/wedgits/carbohidrate_wedgit.dart';
import 'package:fitness/features/food/presintation/veiwes/wedgits/ingredients_section.dart';
import 'package:fitness/features/food/presintation/veiwes/wedgits/recipy_steps_setion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../common/common blocs/languge blocs/languge_bloc.dart';
import '../../../../../common/localization/applocalizations.dart';
import '../../../../../common_widget/custtom_detailes_wedgit.dart';
import '../../../../../common_widget/custtom_read_more_descriptons.dart';
import '../../../../../common_widget/food_step_detail_row.dart';
import '../../../../workout_tracker/presintation/weggits/workout_detailes_view_app_bar.dart';

class FoodInfoDetailsViewShimmerLoading extends StatefulWidget {

  const FoodInfoDetailsViewShimmerLoading({super.key});

  @override
  State<FoodInfoDetailsViewShimmerLoading> createState() => _FoodInfoDetailsViewShimmerLoadingState();
}

class _FoodInfoDetailsViewShimmerLoadingState extends State<FoodInfoDetailsViewShimmerLoading> {
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
  List todayMealArr = [
    {
      "name": "Salmon Nigiri",
      "image": "assets/img/m_1.png",
      "time": "28/05/2023 07:00 AM"
    },
    {
      "name": "Lowfat Milk",
      "image": "assets/img/m_2.png",
      "time": "28/05/2023 08:00 AM"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return FoodInfoDetailesSuccessWedgit(state: todayMealArr);
  }
}

class FoodInfoDetailesSuccessWedgit extends StatelessWidget {
  final List state;
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
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: TColor.primaryG)),
            child:
            NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return AssetImageViewAppBarLoading(
                    media,
                    "assets/img/c_2.png",
                    ""
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
                      Shimmer.fromColors(
                        baseColor: TColor.primaryColor2.withOpacity(0.4),
                        highlightColor: Colors.grey[100]!,
                        child:SingleChildScrollView(
                          child:
                          Column(
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
                                child: Container(height: 10 ,width: 100,color: TColor.black,)
                              ),
                              SizedBox(
                                height: media.width * 0.05,
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Container(height: 10 ,width: 50,color: TColor.black,)
                              ),
                              SizedBox(
                                height: media.width * 0.05,
                              ),
                              // CarbohidrateWedgit(list:state),
                              CusttomAppTitle(title:
                              "${AppLocalazations.of(context)!.translate("ExercisesPage")["Descriptions"]}"),
                              const SizedBox(
                                height: 4,
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Container(height: 10 ,width: 400,color: TColor.black,)
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              // IngredientsSection(
                              //   media: media,
                              //   ingredientsArr: state.ingredients!,
                              // ),
                              const SizedBox(
                                height: 15,
                              ),
                              FoodStepDetailRow(sObj: '', index: 0,),
                              Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Container(height: 10 ,width: 400,color: TColor.black,)
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Container(height: 10 ,width: 300,color: TColor.black,)
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Container(height: 10 ,width: 200,color: TColor.black,)
                              )
                              ,  const SizedBox(
                                height: 15,
                              ), Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Container(height: 10 ,width: 100,color: TColor.black,)
                              ),

                              // RecipyStepsSetion(
                              //   stepArr: ["Prepare all of the ingredients that needed",
                              //     "Mix flour, sugar, salt, and baking powder",
                              //     "In a seperate place, mix the eggs and liquid milk until blended",
                              //     "Put the egg and milk mixture into the dry ingredients, Stir untul smooth and smooth",
                              //     "Prepare all of the ingredients that needed"],
                              // ),
                              SizedBox(
                                height: media.width * 0.25,
                              ),
                            ],
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
    // Shimmer.fromColors(
    //   baseColor: TColor.primaryColor2.withOpacity(0.4),
    //   highlightColor: Colors.grey[100]!,
    //   child: ,
    // );


  }
}
