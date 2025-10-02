import 'package:flutter/material.dart';

import '../common/colo_extension.dart';
class ImageErrorContainer extends StatelessWidget {
  const ImageErrorContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Icon(Icons.error, color: TColor.primaryColor2,),);
  }
}
