import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitness/features/auth/presintation/views/widgets/what%20your%20goal%20view/back_groung_page.dart';
import 'package:fitness/features/auth/presintation/views/widgets/what%20your%20goal%20view/goales_slider.dart';
import 'package:flutter/material.dart';

class WhatYourGoalView extends StatefulWidget {
  const WhatYourGoalView({super.key});

  @override
  State<WhatYourGoalView> createState() => _WhatYourGoalViewState();
}

class _WhatYourGoalViewState extends State<WhatYourGoalView> {
  CarouselSliderController buttonCarouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          GoalesSlyder(
              buttonCarouselController: buttonCarouselController, media: media),
          BackGroundPage(media: media)
        ],
      )),
    );
  }
}
