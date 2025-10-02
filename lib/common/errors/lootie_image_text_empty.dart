import 'package:fitness/common_widget/custtom_app_title.dart';
import 'package:fitness/common_widget/custtom_next_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../styles.dart';
class LottieImageTextEmpty extends StatelessWidget {
  final String title;
  final void Function() onPress;
  const LottieImageTextEmpty({super.key, required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset(
          'assets/img/sad.json',
          width: 200,
          height: 200,
          repeat: true,     // Default is true
          reverse: false,   // Play backwards
          animate: true,    // Start animation automatically
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(title,
              style: Styles.kFontSize16,
            ),
            CusttomNextButton(onPressed: onPress,size: 30,)

          ],
        ),

      ],
    );
  }
}
