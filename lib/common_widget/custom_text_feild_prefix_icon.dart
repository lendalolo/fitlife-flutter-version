import 'package:flutter/material.dart';

import '../common/colo_extension.dart';

class CustomTextFieldPrefixIcon extends StatelessWidget {
   final void Function()? ontap;
  const CustomTextFieldPrefixIcon({
    super.key,
    required this.icon, this.ontap,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:ontap ,
      child: Container(
          alignment: Alignment.center,
          width: 20,
          height: 20,
          child: Icon(
            icon,
            // width: 20,
            // height: 20,
            // fit: BoxFit.contain,
            color: TColor.gray,
          )),
    );
  }
}