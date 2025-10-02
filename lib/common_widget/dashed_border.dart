// import 'package:flutter/material.dart';
// class DashedBorder extends StatelessWidget {
//  final CardRadius = 10.0;
//   const DashedBorder({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return DottedBorder(
//         color: Colors.black,
//         strokeWidth: 3,
//         radius: Radius.circular(CardRadius),
//     dashPattern: [10, 5],
//     customPath: (size) {
//     return Path()
//     ..moveTo(CardRadius, 0)
//     ..lineTo(size.width - CardRadius, 0)
//     ..arcToPoint(Offset(size.width, CardRadius), radius: Radius.circular(CardRadius))
//     ..lineTo(size.width, size.height - CardRadius)
//     ..arcToPoint(Offset(size.width - CardRadius, size.height), radius: Radius.circular(CardRadius))
//     ..lineTo(CardRadius, size.height)
//     ..arcToPoint(Offset(0, size.height - CardRadius), radius: Radius.circular(CardRadius))
//     ..lineTo(0, CardRadius)
//     ..arcToPoint(Offset(CardRadius, 0), radius: Radius.circular(CardRadius));
//     },
//     child: Container(...)
//   }
//   }
// }
