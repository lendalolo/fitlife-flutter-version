import 'package:fitness/common/styles.dart';
import 'package:flutter/material.dart';


class OnBoardingPage extends StatelessWidget {
  final Map pObj;
  const OnBoardingPage({super.key, required this.pObj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: media.width,
          child: Image.asset(
            pObj["image"].toString(),
            width: media.width,
            fit: BoxFit.fitWidth,
          ),
        ),
        SizedBox(
          height: media.width * 0.1,
        ),
        Title(),
        SubTitle(),
      ],
    );
  }

  Padding SubTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        pObj["subtitle"].toString(),
        style: Styles.kFontSize14,
      ),
    );
  }

  Padding Title() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(pObj["title"].toString(), style: Styles.kFontSize24),
    );
  }
}
