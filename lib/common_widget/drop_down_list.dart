import 'package:fitness/features/home/presintation/views_blocs/Exersices%20data/exercies_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/colo_extension.dart';
import '../common/styles.dart';


class DropDownList extends StatelessWidget {
  final List<String> item ;
  final Widget? icon;
  final Widget? hint ;
  final void Function(String?) onChanged;
  const DropDownList({
    super.key, required this.item, this.hint, required this.onChanged, this.icon,
  });



  @override
  Widget build(BuildContext context) {
    return SizedBox(
    //  width: 100,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          items: item
              .map(
                (name) => DropdownMenuItem(
              value: name,
              child: Text(name, style: Styles.kFontSize14),
            ),
          )
              .toList(),
          onChanged: onChanged,
              icon: icon ??Icon(Icons.expand_more, color: TColor.white),
              hint:hint
        ),
      ),
    );
  }
}
