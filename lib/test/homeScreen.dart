import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'configuration.dart';
import 'screen2.dart';

class HomeScreen extends StatefulWidget {
  final Widget page;
  HomeScreen(this.page);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    return Positioned(
     width: 288,
  height: MediaQuery.of(context).size.height,
      child: widget.page,
    );
  }
}
//SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 50,
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   isDrawerOpen
//                       ? IconButton(
//                           icon: Icon(Icons.arrow_back_ios),
//                           onPressed: () {
//                             setState(() {
//                               xOffset = 0;
//                               yOffset = 0;
//                               scaleFactor = 1;
//                               isDrawerOpen = false;
//                             });
//                           },
//                         )
//                       : IconButton(
//                           icon: Icon(Icons.menu),
//                           onPressed: () {
//                             setState(() {
//                               xOffset = 30;
//                               yOffset = 50;
//                               scaleFactor = 0.6;
//                               isDrawerOpen = true;
//                             });
//                           }),
//                   Column(
//                     children: [
//                       const Text('Location'),
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.location_on,
//                             color: primaryGreen,
//                           ),
//                           const Text('Ukraine'),
//                         ],
//                       ),
//                     ],
//                   ),
//                   const CircleAvatar()
//                 ],
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//               margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
//               decoration: BoxDecoration(
//                   color: Colors.white, borderRadius: BorderRadius.circular(20)),
//               child: const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Icon(Icons.search),
//                   Text('Search pet to adopt'),
//                   Icon(Icons.settings)
//                 ],
//               ),
//             ),
//             Container(
//               height: 120,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: categories.length,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     child: Column(
//                       children: [
//                         Container(
//                           padding: EdgeInsets.all(10),
//                           margin: EdgeInsets.only(left: 20),
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               boxShadow: shadowList,
//                               borderRadius: BorderRadius.circular(10)),
//                           child: Image.asset(
//                             categories[index]['iconPath'],
//                             height: 50,
//                             width: 50,
//                             color: Colors.grey[700],
//                           ),
//                         ),
//                         Text(categories[index]['name'])
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => Screen2()));
//               },
//               child: Container(
//                 height: 240,
//                 margin: EdgeInsets.symmetric(horizontal: 20),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Stack(
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                               color: Colors.blueGrey[300],
//                               borderRadius: BorderRadius.circular(20),
//                               boxShadow: shadowList,
//                             ),
//                             margin: EdgeInsets.only(top: 50),
//                           ),
//                           Align(
//                             child: Hero(
//                                 tag: 1,
//                                 child: Image.asset('assets/img/pet-cat2.png')),
//                           )
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                         child: Container(
//                       margin: EdgeInsets.only(top: 60, bottom: 20),
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           boxShadow: shadowList,
//                           borderRadius: BorderRadius.only(
//                               topRight: Radius.circular(20),
//                               bottomRight: Radius.circular(20))),
//                     ))
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               height: 240,
//               margin: EdgeInsets.symmetric(horizontal: 20),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Stack(
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             color: Colors.orange[100],
//                             borderRadius: BorderRadius.circular(20),
//                             boxShadow: shadowList,
//                           ),
//                           margin: EdgeInsets.only(top: 50),
//                         ),
//                         Align(
//                           child: Image.asset('assets/img/pet-cat1.png'),
//                         )
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                       child: Container(
//                     margin: EdgeInsets.only(top: 60, bottom: 20),
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         boxShadow: shadowList,
//                         borderRadius: BorderRadius.only(
//                             topRight: Radius.circular(20),
//                             bottomRight: Radius.circular(20))),
//                   ))
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 50,
//             )
//           ],
//         ),
//       )