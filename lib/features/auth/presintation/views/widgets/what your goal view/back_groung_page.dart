import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../common/utls/name_class.dart';
import '../../../../../../common_widget/Custom_app_button.dart';
import '../title.dart';

class BackGroundPage extends StatelessWidget {
  const BackGroundPage({
    super.key,
    required this.media,
  });

  final Size media;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height:18,
        ),
        const CustomTitle(title: "What is your goal ?", subTitle: "It will help us to choose a best\nprogram for you"),
        const Spacer(),
        SizedBox(
          height: media.width * 0.05,
        ),
        Padding(
          padding: const EdgeInsets.all(26.0),
          child: CusttomAppButton(
              title: "Confirm",
              onPressed: () async{
                GoRouter.of(context).goNamed(Names.ConfirmRegisterPage);

              }),
        ),
      ],
    );
  }
}