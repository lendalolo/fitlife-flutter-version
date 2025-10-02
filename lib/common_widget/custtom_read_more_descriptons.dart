import 'package:flutter/material.dart';
import 'custtom_read_more_text_widget.dart';
class CusttomReadMorDescription extends StatelessWidget {

  final  String test;
  const CusttomReadMorDescription({
    super.key, required this.test,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4  ),
      child: CusttomReadMoreTextWedgit(text: test),
    );
  }
}
