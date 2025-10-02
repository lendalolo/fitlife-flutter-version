import 'package:flutter/material.dart';
import '../../../../../common/colo_extension.dart';

class ImageButton extends StatelessWidget {
  final String image;
  final VoidCallback ontap;
  const ImageButton({
    super.key, required this.image, required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 50,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: TColor.gray.withOpacity(0.4),
          ),
          borderRadius: BorderRadius.circular(15),
        ),child: Image.asset(image,height: 20,width: 20,),
      ),
    );
  }
}