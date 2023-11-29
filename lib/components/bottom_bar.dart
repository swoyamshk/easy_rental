import 'package:easy_rental_nepal/views/login.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../views/emailSignup.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  BottomBarState createState() => BottomBarState();
}

class BottomBarState extends State<BottomBar> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return buildSalomonBottomBar();
  }

  Widget buildSalomonBottomBar() {
    return SalomonBottomBar(
      currentIndex: _currentIndex,
      onTap: (i) => onTabTapped(i),
      items: [
        SalomonBottomBarItem(
          icon: Icon(Icons.home),
          title: Text("Home"),
          selectedColor: Colors.purple,
        ),
        SalomonBottomBarItem(
          icon: Icon(Icons.favorite_border),
          title: Text("Inbox"),
          selectedColor: Colors.pink,
        ),
        SalomonBottomBarItem(
          icon: Icon(Icons.search),
          title: Text("Bookings"),
          selectedColor: Colors.orange,
        ),
        SalomonBottomBarItem(
          icon: Icon(Icons.person),
          title: Text("Profile"),
          selectedColor: Colors.teal,
        ),
      ],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Handle navigation based on the selected tab
    switch (index) {
      case 0:
      // Navigate to the Home page
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
      // Navigate to the Inbox page
        Navigator.pushNamed(context, '/inbox');
        break;
      case 2:
      // Navigate to the Bookings page
        Navigator.pushNamed(context, '/booking'); // Replace '/bookings' with the actual route for the Bookings page
        break;
      case 3:
      // Navigate to the Profile page
        Navigator.pushNamed(context, '/profile'); // Replace '/profile' with the actual route for the Profile page
        break;
    }
  }
}
