import 'package:flutter/material.dart';

import '../common/colo_extension.dart';
class CusttomNextButton extends StatelessWidget {
  final double size;
  const CusttomNextButton({
    super.key,
    required this.onPressed,  this.size =20,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Center(
        child: IconButton(
            padding: EdgeInsets.zero,
            alignment: Alignment.center,
            onPressed: onPressed,
            color: TColor.gray,
            style: ButtonStyle(
                shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                        side: BorderSide(
                          color: TColor.gray, // your color here
                          width: 2,
                        ),
                        borderRadius:
                        const BorderRadius.all(Radius.circular(50))))),
            icon: Icon(
              Icons.navigate_next_outlined,
              size: size,
            )),
      ),
    );
  }
}