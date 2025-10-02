
import 'package:fitness/features/on_boarding/presentation/views/widgets/next_page_button.dart';
import 'package:fitness/features/on_boarding/presentation/views/widgets/pages_list.dart';
import 'package:flutter/material.dart';
import '../../../../common/colo_extension.dart';


class OnBoardingView extends StatelessWidget {

  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    return Scaffold(
      backgroundColor: TColor.white,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PagesList(controller: controller),
          NextPageButton(controller: controller,)
        ],
      ),
    );
  }
}


