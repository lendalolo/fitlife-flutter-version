import 'package:fitness/common/localization/applocalizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/colo_extension.dart';
import '../common/common blocs/languge blocs/languge_bloc.dart';
import '../common/styles.dart';
import '../features/workout_tracker/data/models/goales_model.dart';

class CusttomDetailesWedgit extends StatelessWidget {
  final String title;
  final String SubTitle;

  const CusttomDetailesWedgit({super.key, required this.title, required this.SubTitle});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LangugeBloc, LangugeState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Styles.kFontSize16,
                  ),
                  Text(SubTitle,
                   style: Styles.kFontSize12.copyWith(color: TColor.gray),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Image.asset(
                "assets/img/fav.png",
                width: 15,
                height: 15,
                fit: BoxFit.contain,
              ),
            )
          ],
        );
      },
    );
  }
}
