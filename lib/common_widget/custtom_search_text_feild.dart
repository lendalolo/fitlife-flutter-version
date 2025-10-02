import 'package:fitness/common_widget/round_textfield.dart';
import 'package:flutter/material.dart';

import '../common/colo_extension.dart';
import '../common/localization/applocalizations.dart';
import 'drop_down_list.dart';
class CusttomSearchTextFeild extends StatelessWidget {
  const CusttomSearchTextFeild({
    super.key,
    required this.txtSearch, required this.SearshTestHint, required this.dropDownListItems, required this.onChanged,
  });

  final TextEditingController txtSearch;
  final String SearshTestHint;
  final List<String> dropDownListItems;
  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          color: TColor.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: TColor.kBoxShadow),
      child: Row(
        children: [
          Expanded(
              child: CustomTextField(hitText:  SearshTestHint ,
                icon: Icons.search_rounded,controller:txtSearch ,decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),)
          ),
          Container(
            //    margin: const EdgeInsets.symmetric(horizontal: 8),
            width: 1,
            height: 25,
            color: TColor.gray.withOpacity(0.3),
          ),
          DropDownList(icon:Icon(Icons.filter_tilt_shift,size: 20,) ,
            item: dropDownListItems, onChanged:  onChanged),
        ],
      ),
    );
  }
}