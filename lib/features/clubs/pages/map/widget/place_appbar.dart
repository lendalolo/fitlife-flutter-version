import 'package:flutter/material.dart';

import '../../../../../common/colo_extension.dart';


class PlaceAppbar extends StatelessWidget {
  final String text;
  const PlaceAppbar({super.key, required this.text});

  // get myGradient1 => null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(16),
        height: 60,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              TColor.primaryColor1.withOpacity(0.8),
              TColor.secondaryColor1.withOpacity(0.8),
              TColor.white,
            ],
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                shadows: [
                  BoxShadow(
                    color: Color(0xff2d16ff),
                    offset: Offset(0, 0),
                    blurRadius: 9,
                    spreadRadius: 50,
                    blurStyle: BlurStyle.solid,
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(width: 120),

            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.white,
                // shadows: [
                //   BoxShadow(
                //     color: Color(0xff2d16ff),
                //     offset: Offset(0, 0),
                //     blurRadius: 9,
                //     spreadRadius: 50,
                //     blurStyle: BlurStyle.solid,
                //   ),
                // ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
