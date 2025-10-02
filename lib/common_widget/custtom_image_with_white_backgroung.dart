import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'image_error_container.dart';


class CustomImageWithWithBackground extends StatelessWidget {
  const CustomImageWithWithBackground({
    super.key, required this.ImageName, required this.imageWidth, required this.imageHight, required this.witheBackgroungWidth, required this.witheBackgroungHight,
  });

  final String ImageName;
  final double imageWidth;
  final double imageHight;
  final double witheBackgroungWidth;
  final double witheBackgroungHight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: witheBackgroungWidth,
          height:  witheBackgroungHight,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.54),
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: CachedNetworkImage(
              errorWidget: (context, url, error) =>
              const ImageErrorContainer(),
              imageUrl:ImageName,
              width: imageWidth,
              height: imageHight,
              fit: BoxFit.contain),
        ),
      ],
    );
  }
}