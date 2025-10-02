import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/api_servieses.dart';
import '../../../../../common/colo_extension.dart';
import '../../../../../common/common blocs/languge blocs/languge_bloc.dart';
import '../../../../../common/styles.dart';
import '../../../../../common_widget/image_error_container.dart';
import '../../../data/models/meal_detailes.dart';

class IngreadientItem extends StatelessWidget {
  final Ingredients nObj;
  final Size media;
  const IngreadientItem({super.key, required this.media, required this.nObj});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        width: media.width * 0.23,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: media.width * 0.23,
              height: media.width * 0.23,
              decoration: BoxDecoration(
                  color: TColor.lightGray,
                  borderRadius: BorderRadius.circular(10)),
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(70),
                child: CachedNetworkImage(
                  errorWidget: (context, url, error) =>
                  const ImageErrorContainer(),
                  imageUrl:
                  nObj.media!.isEmpty?'assets/img/salad.png': '$imageBaseUrl${nObj.media![0].originalUrl!.split('8000/').last}',
                  width: media.width * 0.25,
                  height: media.width * 0.25,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            BlocBuilder<LangugeBloc, LangugeState>(
              builder: (context, state) {
                return Text(
                    state.locale == Locale('ar') ? nObj.nameAr! : nObj.name!,
                    style: Styles.kFontSize12.copyWith(color: TColor.black));
              },
            ),
            Text(
              nObj.num.toString(),
              style: Styles.kFontSize10,
            ),
          ],
        ));
  }
}
