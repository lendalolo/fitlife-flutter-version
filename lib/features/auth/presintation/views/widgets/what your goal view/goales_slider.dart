import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../../../common/colo_extension.dart';
import '../../../../../../common/styles.dart';
import 'goal_list.dart';

class GoalesSlyder extends StatelessWidget {
  const GoalesSlyder({
    super.key,
    required this.buttonCarouselController,
    required this.media,
  });

  final CarouselSliderController buttonCarouselController;
  final Size media;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider(
        carouselController: buttonCarouselController,
        items: goalArr
            .map(
              (gObj) => Container(
            decoration: BoxDecoration(
              gradient: TColor.kcardGradiant,
              borderRadius: BorderRadius.circular(25),
            ),
            padding: EdgeInsets.symmetric(
                vertical: media.width * 0.1, horizontal: 25),
            alignment: Alignment.center,
            child: FittedBox(
              child: Column(
                children: [
                  Image.asset(
                    gObj.image,
                    width: media.width * 0.5,
                    fit: BoxFit.fitWidth,
                  ),
                  SizedBox(
                    height: media.width * 0.1,
                  ),
                  Text(
                    gObj.title,
                    style: Styles.kFontSize14.copyWith(color: TColor.white),
                  ),
                  UnderLine(media: media),
                  SizedBox(
                    height: media.width * 0.02,
                  ),
                  Text(
                    gObj.subTitle ,
                    textAlign: TextAlign.center,
                    style:
                    Styles.kFontSize12,
                  ),
                ],
              ),
            ),
          ),
        ).toList(),
        options: CarouselOptions(
          autoPlay: false,
          enlargeCenterPage: true,
          viewportFraction: 0.7,
          aspectRatio: 0.74,
          initialPage: 0,
        ),
      ),
    );
  }
}
class UnderLine extends StatelessWidget {
  const UnderLine({
    super.key,
    required this.media,
  });

  final Size media;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: media.width * 0.1,
      height: 1,
      color: TColor.white,
    );
  }
}