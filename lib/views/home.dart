import 'package:flutter/material.dart';
import 'package:easy_rental_nepal/modules/car_tiles.dart';

import '../components/bottom_bar.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return homeState();
  }
}

class homeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
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
                    ),
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
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 45,
                    width: 180,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(176, 0, 0, 0),
                      borderRadius: BorderRadius.circular(30),
                    ),
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
                            // Align text to the left
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
                      SizedBox(
                        height: 20,
                      ),
                      CarTiles(),
                      SizedBox(
                        height: 20,
                      ),
                      CarTiles(),
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
        )),
        bottomNavigationBar: const BottomBar(),
      ),
    );
  }
}
