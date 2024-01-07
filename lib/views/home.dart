import 'package:easy_rental_nepal/views/helpcenter.dart';
import 'package:easy_rental_nepal/views/history.dart';
import 'package:easy_rental_nepal/views/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:easy_rental_nepal/tiles/car_tiles.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../global/globalColors.dart';
import '../global/globalShadow.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  var _currentIndex = 0;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final PageController _pageController = PageController();

  homewidget() {
    User? user = _auth.currentUser;
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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only( right:15, top: 50, left: 30),
                  child: Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      color: GlobalColors.boxColor,
                      shape: BoxShape.circle,
                      boxShadow: [CustomBoxShadow()],
                    ),
                    child: user != null && user.photoURL != null
                        ? ClipOval(
                      child: Image.network(
                        user.photoURL!,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    )
                        : Icon(
                      Icons.person,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15), // Adjust the left padding as needed
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: user != null && user.displayName != null
                                  ? "Good Evening,\n"
                                  : "Name",
                              style: TextStyle(
                                fontSize: 17, // Font size for "Good Morning"
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: user != null && user.displayName != null
                                  ? user.displayName!
                                  : "",
                              style: TextStyle(
                                fontSize: 20, // Font size for displayName
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),


              ],
            ),
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
            const SizedBox(height: 10),
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
