import 'package:fitness/common/styles.dart';
import 'package:fitness/common_widget/round_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../common/colo_extension.dart';
import '../../../../../common/localization/applocalizations.dart';
import '../../../../../common/utls/name_class.dart';


class FoodPeriodItem extends StatelessWidget {
  final Map fObj;
  final int index;
  final int length;
  const FoodPeriodItem({super.key, required this.index, required this.fObj, required this.length});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool isEvent = index % 2 == 0;
    return Container(
      margin: const EdgeInsets.all(8),
      width: media.width * 0.5,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isEvent
                ? TColor.primaryGWithOpacity
                : TColor.secondaryGWithOpacity,
          ),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(75),
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                fObj["image"].toString(),
                width: media.width * 0.3,
                height: media.width * 0.25,
                fit: BoxFit.contain,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              fObj["name"],
              style: Styles.kFontSize14.copyWith(fontWeight: FontWeight.w500),)
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 15),
          //   child: Text(
          //     //    'Foods + $length',
          //     fObj["number"],
          //     style: Styles.kFontSize12.copyWith(color: TColor.gray),
          //   ),
          // ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              width: 90,
              height: 25,
              child: RoundButton(
                  fontSize: 12,
                  title:  AppLocalazations.of(context)!
                      .translate("Meals Planer")["View"] ,
                  onPressed: () {
                    List check =[];
                    for(int i=0;i<4;i++)
                      {
                        if(index ==i) {
                          check.add(1);
                        }
                        else check.add(0);
                      }
                    GoRouter.of(context).pushNamed(Names.MaelFoodDetaileView,extra: [check[0],check[1],check[2],check[3],fObj]);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
