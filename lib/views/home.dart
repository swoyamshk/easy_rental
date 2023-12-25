import 'package:easy_rental_nepal/views/helpcenter.dart';
import 'package:easy_rental_nepal/views/history.dart';
import 'package:easy_rental_nepal/views/profile.dart';
import 'package:flutter/material.dart';
import 'package:easy_rental_nepal/modules/car_tiles.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../global/globalShadow.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState(); // Corrected class name to HomeState
  }
}

class HomeState extends State<Home> {
  var _currentIndex = 0;

  final PageController _pageController = PageController();

  homewidget() {
    double size = MediaQuery.of(context).size.width;
    return WillPopScope(onWillPop: ()async {
      final difference = DateTime.now().difference(timeBackPressed);
      final isExitWarning = difference >= Duration(seconds: 2);

      timeBackPressed = DateTime.now();
      if (isExitWarning) {
        final message = "Press back again to exit";
        Fluttertoast.showToast(msg: message, fontSize: 10);
        return false;
      } else {
        Fluttertoast.cancel();
        return true;
      }
    },
        child: Column(
          children: [
            const SizedBox(height: 60),
            Padding(
              padding: EdgeInsets.only(left: 25, bottom: size * 0.02),
              child: Row(
                children: [
                  Container(
                    height: 45,
                    width: size * 0.44,
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
                            fontFamily: 'Montserrat',
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
                    width: size * 0.4,
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
                            fontFamily: 'Montserrat',
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
              width: size * 0.9,
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
                        fontFamily: 'Montserrat',
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
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: size * 0.1),
                              child: Text(
                                "Recommended",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 115,
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/book');
                              },
                              child: Icon(Icons.arrow_forward))
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

  DateTime timeBackPressed = DateTime.now();

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
