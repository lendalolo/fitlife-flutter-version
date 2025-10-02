import 'package:flutter/material.dart';

Color primaryGreen = Color(0xff416d6d);
List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey[300]!, blurRadius: 30, offset: Offset(0, 10))
];

List<Map> categories = [
  {'name': 'Cats', 'iconPath': 'assets/img/cat.png'},
  {'name': 'Dogs', 'iconPath': 'assets/img/dog.png'},
  {'name': 'Bunnies', 'iconPath': 'assets/img/rabbit.png'},
  {'name': 'Parrots', 'iconPath': 'assets/img/parrot.png'},
  {'name': 'Horses', 'iconPath': 'assets/img/horse.png'}
];

List<Map> drawerItems=[
  {
    'icon':Icons.favorite,
    'title' : 'Adoption'
  },
  {
    'icon': Icons.mail,
    'title' : 'Donation'
  },
  {
    'icon':Icons.favorite,
    'title' : 'Add pet'
  },
  {
    'icon': Icons.favorite,
    'title' : 'Favorites'
  },
  {
    'icon': Icons.mail,
    'title' : 'Messages'
  },
  {
    'icon': Icons.favorite,
    'title' : 'Profile'
  },
];