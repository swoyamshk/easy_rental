import 'package:easy_rental_nepal/views/helpcenter.dart';
import 'package:easy_rental_nepal/views/history.dart';
import 'package:easy_rental_nepal/views/profile.dart';
import 'package:flutter/material.dart';
import 'package:easy_rental_nepal/modules/car_tiles.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../global/globalShadow.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return homeState();
  }
}

class homeState extends State<Home> {
  var _currentIndex = 0;

  final PageController _pageController = PageController();

  homewidget() {
    return Center(
        child: Column(
      children: [
        const SizedBox(height: 60),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                height: 45,
                width: 180,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(176, 0, 0, 0),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [CustomBoxShadow()],
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/book');
                  },
                  child: const Center(
                    child: Text(
                      "Book Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 45,
                width: 180,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(176, 0, 0, 0),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [CustomBoxShadow()],
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/rent');
                  },
                  child: const Center(
                    child: Text(
                      "Rent a Car",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 45,
          width: 360,
          decoration: BoxDecoration(
            color: const Color.fromARGB(176, 0, 0, 0),
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Center(
            child: Row(
              children: [
                const SizedBox(width: 20),
                Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                const SizedBox(width: 15),
                Text(
                  "Search Vehicle",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: const [
              Column(
                children: [
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: Text(
                            "Recommended",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 130,
                      ),
                      Icon(Icons.arrow_forward)
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CarTiles(),
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (int index) {
          setState(() {
            onTabTapped(index);
          });
        },
        controller: _pageController,
        children: <Widget>[homewidget(), History(), HelpCenter(), Profile()],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => onTabTapped(i),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.history),
            title: const Text("History"),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.help_center_outlined),
            title: const Text("Help Center"),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Profile"),
            selectedColor: Colors.purple,
          ),
        ],
      ),

    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(_currentIndex);
    });
  }
}
