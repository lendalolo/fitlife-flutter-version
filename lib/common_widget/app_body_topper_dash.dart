import 'package:flutter/material.dart';

import '../common/colo_extension.dart';

class AppBodyTopperDash extends StatelessWidget {
  const AppBodyTopperDash({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50,
        height: 4,
        decoration: BoxDecoration(
            color: TColor.gray.withOpacity(0.3),
            borderRadius: BorderRadius.circular(3)),
      ),
    );
  }
}