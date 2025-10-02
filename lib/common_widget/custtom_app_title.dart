import 'package:flutter/material.dart';

import '../common/styles.dart';

class CusttomAppTitle extends StatelessWidget {
  const CusttomAppTitle({
    super.key, required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
            style: Styles.kFontSize16,
          ),
        ],
      ),
    );
  }
}