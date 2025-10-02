import 'package:flutter/material.dart';

import '../../../../../common/colo_extension.dart';

class CusttomAppBarIconWedgir extends StatelessWidget {
  final VoidCallback ontap;
  final Widget child;
  const CusttomAppBarIconWedgir({
    super.key,
    required this.ontap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: IconButton(
        onPressed: ontap,
        icon: child,
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(TColor.lightGray),
          shape: const MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}