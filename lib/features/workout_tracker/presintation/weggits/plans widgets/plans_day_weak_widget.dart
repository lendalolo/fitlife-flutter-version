import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:fitness/common/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../common/colo_extension.dart';
import '../../../../../common/localization/applocalizations.dart';
import '../../../../../common_widget/custtom_circle_dash_count_widget.dart';

class PlansDayWeakWidget extends StatelessWidget {
  final int index;
  final bool isLast;
  final List<String> isCheckedList;
  final List<int> holidayList;
  final Function(int dayIndex) ontap;
  const PlansDayWeakWidget(
      {super.key, this.isLast = false, required this.index, required this.ontap, required this.isCheckedList, required this.holidayList});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 40,
          child: Text('${index+1} ${AppLocalazations.of(context)!.translate("general")["Week"]}',
            style: Styles.kFontSize12.copyWith(
              color: TColor.primaryColor1,
            ),
          ),
        ),
        CusttomCircleDashItemCount(isLast: isLast, color: TColor.primaryColor1, height: 120,),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: TColor.gray.withOpacity(.1),
                border: Border.all(
                    width: 2,
                    style: BorderStyle.solid,
                    color: TColor.primaryColor1),
                borderRadius: BorderRadius.circular(30)),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 50,crossAxisSpacing: 12, mainAxisSpacing: 12,),
              itemBuilder: (context, index) {
                 if(
                 int.parse(isCheckedList[index+(7*this.index)].split('-')[0]) == DateTime.now().year &&
                     int.parse(isCheckedList[index+(7*this.index)].split('-')[1]) == DateTime.now().month &&
                     int.parse(isCheckedList[index+(7*this.index)].split('-')[2]) == DateTime.now().day
                     // && (index+(7*this.index))==isCheckedList.indexOf(isCheckedList[index+(7*this.index)])
                 )
                   {
                     return TextButton(
                       onPressed: (){
                         ontap(index);
                       },
                       style: ButtonStyle(
                         backgroundColor: MaterialStatePropertyAll(TColor.white),
                         shape: MaterialStatePropertyAll(
                           RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(100),
                             side:  BorderSide(
                                 color:holidayList[index+(7*this.index)]==1?  Colors.green: TColor.primaryColor1,
                                 style: BorderStyle.solid,
                                 width: 3
                             ),
                           ),
                         ),
                       ),
                       child: Text('${index + 1}',style: Styles.kFontSize16,),
                     );
                   }
                 // if(
                 // int.parse(isCheckedList[index+(7*this.index)].split('-')[0]) == DateTime.now().year &&
                 //     int.parse(isCheckedList[index+(7*this.index)].split('-')[1]) == DateTime.now().month &&
                 //     int.parse(isCheckedList[index+(7*this.index)].split('-')[2]) == DateTime.now().day
                 // &&
                 // // && (index+(7*this.index))==isCheckedList.indexOf(isCheckedList[index+(7*this.index)])
                 // )
                 return TextButton(
                   onPressed: (){},
                   style: ButtonStyle(
                     backgroundColor: MaterialStatePropertyAll(TColor.white),
                     shape: MaterialStatePropertyAll(
                       RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(100),
                         side: BorderSide(
                             color: TColor.gray,
                             style: BorderStyle.solid,
                             width: 3
                         ),
                       ),
                     ),
                   ),
                   child: Text('${index + 1}',style: Styles.kFontSize16,),
                 );
              },
              itemCount: 7,
            ),
          ),
        ),
        //  const SizedBox(height: 15,)
      ],
    );
  }
}
