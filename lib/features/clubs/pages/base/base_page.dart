import 'package:fitness/features/clubs/pages/base/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

// import 'package:gyms/pages/chat/chat_page.dart';
import '../../../../common/colo_extension.dart';
import '../../global_widgets/app_scaffold.dart';
import '../../global_widgets/app_text.dart';
import '../gyms/gyms_page.dart';
import '../map/map_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  static String get name => "BasePage";

  static String get path => "/BasePage";

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    GymsPage(),
    MapsScreen()
    //  ChatPage()
  ];

  void _onNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(

      backgroundColor: TColor.lightGray,
      appBar: AppBar(
        backgroundColor: TColor.primaryColor1.withOpacity(0.8),
        title: AppText("Gyms", color: Colors.black),
      ),
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBarHomeWidget(
        onItemTapped: _onNavTap,
      ),
    );
  }
}
