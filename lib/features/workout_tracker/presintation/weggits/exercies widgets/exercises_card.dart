import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/common/styles.dart';
import 'package:fitness/common_widget/image_error_container.dart';
import 'package:fitness/features/workout_tracker/data/models/exercieses_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/api_servieses.dart';
import '../../../../../common/common blocs/languge blocs/languge_bloc.dart';
import '../../../../../common_widget/custtom_next_button.dart';

class ExercisesRow extends StatelessWidget {
  final Exercise eObj;
  final VoidCallback onPressed;
  final int index;
  final List<bool> isFinished ;
  const ExercisesRow(
      {super.key,
      required this.eObj,
      required this.onPressed,
      required this.index, required this.isFinished});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: SizedBox(
        // width: MediaQuery.of(context).size.width * .5,
        // height:900,
        child: Stack(
          children: [
            isFinished[index]? const Align(alignment: FractionalOffset.topRight,child: Icon(Icons.check,color: TColor.primaryColor1,)):Container(),
            ClipRRect(
              borderRadius: BorderRadius.circular(500),
              child: CachedNetworkImage(
                errorWidget: (context, url, error) =>
                    const ImageErrorContainer(),
                imageUrl:
                eObj.media!.isEmpty?'':'$imageBaseUrl${eObj.media![0].originalUrl!.split('8000/').last}',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.contain,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                decoration: const BoxDecoration(
                    gradient: TColor.kcardGradiant,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(50))),
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  (index + 1).toString(),
                  style: Styles.kFontSize14.copyWith(color: TColor.black),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //SizedBox(height: 70,),
                  BlocBuilder<LangugeBloc, LangugeState>(
                    builder: (context, state) {
                      return Text(
                        state.locale == const Locale('ar')
                            ? eObj.titleAr.toString()
                            : eObj.title.toString(),
                        style: Styles.kFontSize14.copyWith(
                            fontWeight: FontWeight.w500, color: TColor.black),
                      );
                    },
                  ),
                  Text(
                    eObj.duration.toString(),
                    style: Styles.kFontSize12.copyWith(color: TColor.gray),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CusttomNextButton(onPressed: onPressed),
              ),
            )
          ],
        ),
      ),
    );
  }
}
