import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../common/colo_extension.dart';

class CusttomReadMoreTextWedgit extends StatelessWidget {
  const CusttomReadMoreTextWedgit({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      trimLines: 4,
      colorClickableText: TColor.black,
      trimMode: TrimMode.Line,
      trimCollapsedText: ' Read More ...',
      trimExpandedText: ' Read Less',
      style: TextStyle(
        color: TColor.gray,
        fontSize: 14,
      ),
      moreStyle:
      const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
    );
  }
}