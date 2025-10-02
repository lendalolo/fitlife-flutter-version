import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../common/colo_extension.dart';
class PlansNumberShimmerLoaading extends StatelessWidget {
  const PlansNumberShimmerLoaading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: 20,
          width: 40,
          color: Colors.black,
        ));
  }
}
