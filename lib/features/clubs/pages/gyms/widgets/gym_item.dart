import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/api_servieses.dart';
import '../../../../../common/colo_extension.dart';
import '../../../../../common_widget/image_error_container.dart';
import '../../../global_widgets/app_image.dart';
import '../../../global_widgets/app_text.dart';
import '../gym_details_page.dart';
import '../models/gym_model.dart';
import '../models/gyms_model.dart';

class GymItem extends StatelessWidget {
  const GymItem({
    super.key,
    required this.gymModel,
    this.isOnTap = true,
    required this.color,
  });

  final GymModel gymModel;
  final bool isOnTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isOnTap ? () {context.pushNamed(GymDetailsPage.name, extra: gymModel);}
          : null,
      child: Card(
        color: color,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: REdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: CachedNetworkImage(fit: BoxFit.fill,errorWidget: (context, url, error) => const
                ImageErrorContainer(),
                  imageUrl: '$imageBaseUrl${gymModel.media[0].originalUrl.split('8000/').last}',),),
              SizedBox(
                child: AppText.titleMedium(
                  gymModel.name,
                  color: TColor.black,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              4.verticalSpace,
              // AppText.bodyMedium(
              //   gymModel.descriptionAr.isNotEmpty
              //       ? gymModel.descriptionAr
              //       : gymModel.description,
              //   maxLines: 4,
              //   color: TColor.black,
              //   overflow: TextOverflow.ellipsis,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

// class GymItem extends StatelessWidget {
//   const GymItem({
//     super.key,
//     required this.gymModel,
//     this.isOnTap = true,
//     required this.color,
//   });

//   final GymModel gymModel;
//   final bool isOnTap;
//   final Color color;
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: isOnTap
//           ? () {
//               context.pushNamed(GymDetailsPage.name, extra: gymModel);
//             }
//           : null,
//       child: Card(
//         color: color,
//         elevation: 4,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12.r),
//         ),
//         child: Padding(
//           padding: REdgeInsets.all(8),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(8.r),
//                 child: AppImage.asset(
//                   gymModel.image,
//                   width: double.infinity,
//                   height: 100.h,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               8.verticalSpace,
//               SizedBox(
//                 child: AppText.titleMedium(
//                   gymModel.title,
//                   color: TColor.black,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//               4.verticalSpace,
//               AppText.bodyMedium(
//                 gymModel.description,
//                 maxLines: 1,
//                 color: TColor.black,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
