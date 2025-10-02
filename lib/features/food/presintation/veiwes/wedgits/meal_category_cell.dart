import 'package:fitness/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../common/colo_extension.dart';
import '../../../../../common/common blocs/languge blocs/languge_bloc.dart';
import '../../../../../common_widget/custtom_image_with_white_backgroung.dart';
import '../../../data/models/meal_categories.dart';

class MealCategoryCell extends StatelessWidget {
  final CategorieData cObj;
  final int index;
  final String image;

  const MealCategoryCell(
      {super.key, required this.index, required this.cObj, required this.image});

  @override
  Widget build(BuildContext context) {
    bool isEvent = index % 2 == 0;
    return Container(
      margin: const EdgeInsets.all(4),
      width: 80,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isEvent
                ? TColor.primaryGWithOpacity
                : TColor.secondaryGWithOpacity,
          ),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(image.toString(),height: 35,width: 35,),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: BlocBuilder<LangugeBloc, LangugeState>(
                builder: (context, mystate) {
                  return Text(
                    mystate.locale == const Locale("en")
                          ? cObj.title.toString()
                          : cObj.titleAr.toString(),
                   //state.locale ==const Locale('ar')?cObj.titleAr!: cObj.title!,
                    maxLines: 1,
                    style: Styles.kFontSize12.copyWith(color: TColor.gray),);
                },
              )
          ),
        ],
      ),
    );
  }
}
