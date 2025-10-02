import 'package:flutter/material.dart';

import '../common/colo_extension.dart';
import 'image_error_container.dart';

class CusttomAppImageWithGradentBackground extends StatelessWidget {
  const CusttomAppImageWithGradentBackground({super.key, required this.index, required this.image});
  final int index;
  final String image;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 55,
        width: 55,
        decoration: BoxDecoration(
            color: index % 2 == 0 ? TColor.primaryColor2.withOpacity(0.4) : TColor.secondaryColor2.withOpacity(0.4) ,
            borderRadius: BorderRadius.circular(10)),
        alignment: Alignment.center,
        child:
        Image.network(
          image,
          width: 40,
          height: 40,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => ImageErrorContainer(),
        ),
      ),
    );
  }
}