import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

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
          icon: const Icon(Icons.home),
          title: const Text("Home"),
          selectedColor: Colors.purple,
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.inbox_outlined),
          title: const Text("Inbox"),
          selectedColor: Colors.pink,
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.search),
          title: const Text("Bookings"),
          selectedColor: Colors.orange,
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.person),
          title: const Text("Profile"),
          selectedColor: Colors.teal,
        ),
      ],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/inbox');
        break;
      case 2:
        Navigator.pushNamed(context, '/rent');
        break;
      case 3:
        Navigator.pushNamed(context, '/helpcenter');
        break;
    }
  }
}
