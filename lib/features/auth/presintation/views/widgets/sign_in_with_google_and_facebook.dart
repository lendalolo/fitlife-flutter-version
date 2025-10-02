import 'package:flutter/material.dart';

import 'image_button.dart';

class SignUpWithGoogleAndFacebbok extends StatelessWidget {
  const SignUpWithGoogleAndFacebbok({
    super.key,
    required this.media,
  });

  final Size media;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImageButton(
          image: "assets/img/google.png",
          ontap: () {},
        ),
        SizedBox(
          width: media.width * 0.04,
        ),
        ImageButton(
          image: "assets/img/facebook.png",
          ontap: () {},
        ),
      ],
    );
  }
}