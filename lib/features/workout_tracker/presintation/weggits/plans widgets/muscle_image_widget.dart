import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness/common_widget/image_error_container.dart';
import 'package:flutter/material.dart';

import '../../../../../common/api_servieses.dart';
import '../../../../../common/colo_extension.dart';
import '../../../data/models/plans_model.dart';
import '../../views_bloc/plans bloc/plans_bloc.dart';
class MuscleImageWidget extends StatelessWidget {
 final Size media ;
final String imageUrl;
 // final Function(int i) onPressed;
  final int index;
  const MuscleImageWidget({super.key, required this.media, required this.index, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: media.width * 0.35,
      width: media.width * 0.35,
      decoration: BoxDecoration(
          color: TColor.lightGray,
          borderRadius: BorderRadius.circular(15)),
      alignment: Alignment.center,
      child:CachedNetworkImage(errorWidget: (context, url, error) => const ImageErrorContainer(),imageUrl: imageUrl,
        fit: BoxFit.cover,),
    );
  }
}
