import 'package:flutter/material.dart';

import '../../../../../common/colo_extension.dart';
class AppTrackerContainer extends StatelessWidget {
  final double? media;
  final Widget child;
  const AppTrackerContainer({super.key, required this.media, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
    height: media,
    padding: const EdgeInsets.symmetric(
        vertical: 25, horizontal: 20),
    decoration: BoxDecoration(
        color:Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(color: TColor.black.withOpacity(.1), blurRadius: 2)
        ]),
    child: child,
  );
  }
}

