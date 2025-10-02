import 'package:flutter/material.dart';

class MyMenuBar extends StatelessWidget {
   final Widget page;
  const MyMenuBar({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.orange,
            width: 288,
            height: double.infinity,
            child: Column(
              children: [],
            ),
          ),
          page
        ]
      ),
    );
  }
}
