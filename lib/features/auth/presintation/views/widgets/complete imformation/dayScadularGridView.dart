import 'package:flutter/material.dart';

import 'custom_unit_wedgit.dart';
import 'dayCusttomWedgit.dart';

SizedBox dayScadualeGridView({required void Function(int index) onTap1, required List<bool> dayCheckd, required List<String> dayName}) {
  return SizedBox(
    height: 200,
    child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,childAspectRatio: 2),
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              onTap1(index);
            },
            child: DayCusttomWedgit(
              text: dayName[index], check: dayCheckd[index] ,
            ));
      },
      itemCount: 7,
    ),
  );
}

List<String> dayes = [
  "sunday",
  "tuesday",
  "monday",
  "wednesday",
  "thrusday",
  "friday",
  "saturday"
];