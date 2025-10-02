import 'package:flutter/material.dart';

import '../../../../../common/colo_extension.dart';
class CustomFloatingBotton extends StatelessWidget {
 final VoidCallback ontap;
 final IconData icon;
  const CustomFloatingBotton({super.key, required this.ontap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: 30, vertical: 30),
      width: 60,
      height: 60,
      decoration: BoxDecoration(color: TColor.primaryColor1,
          borderRadius: BorderRadius.circular(35)),
      child: IconButton(
        icon: Icon(icon, color: TColor.white,),
        onPressed:ontap),
    );
  }
}
