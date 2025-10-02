
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness/common_widget/image_error_container.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../common/api_servieses.dart';
import '../../../../common/colo_extension.dart';
import '../../../home/presintation/views/widgets/custtom_app_bar.dart';
import '../../data/models/goales_model.dart';
import'package:flutter/material.dart';

List<Widget> workOutDetilesViewAppBar(Size media,String dObj, String title) {
  return [
    CusttomAppBar(title: title,),
    SliverAppBar(
      backgroundColor: Colors.transparent,
      leading: Container(),
      expandedHeight: media.width * 0.5,
      flexibleSpace: Align(
          alignment: Alignment.center,
          child:CachedNetworkImage(errorWidget: (context, url, error) => const ImageErrorContainer(),imageUrl: dObj,
            width: media.width * 0.75,
            height: media.width * 0.8,
            fit: BoxFit.contain,
          )
      ),
    ),
  ];
}
List<Widget> AssetImageViewAppBar(Size media,String dObj, String title) {
  return [
    CusttomAppBar(title: title, ),
    SliverAppBar(
      backgroundColor: Colors.transparent,
      leading: Container(),
      expandedHeight: media.width * 0.5,
      flexibleSpace: Align(
          alignment: Alignment.center,
          child: Image.asset(dObj,
            width: media.width * 0.75,
            height: media.width * 0.8,
            fit: BoxFit.contain,
          )
        //   "assets/img/detail_top.png",
      ),
    ),
  ];
}

List<Widget> AssetImageViewAppBarLoading(Size media,String dObj, String title) {
  return [
    CusttomAppBar(title: title, ),
    SliverAppBar(
      backgroundColor: Colors.transparent,
      leading: Container(),
      expandedHeight: media.width * 0.5,
      flexibleSpace: Align(
          alignment: Alignment.center,
          child:    Shimmer.fromColors(
  baseColor: TColor.primaryColor2.withOpacity(0.4),
  highlightColor: Colors.grey[100]!,
  child:Image.asset(dObj,
    width: media.width * 0.75,
    height: media.width * 0.8,
    fit: BoxFit.contain,
  ) ,
  )
        //   "assets/img/detail_top.png",
      ),
    ),
  ];
}