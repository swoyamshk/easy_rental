import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import '../global/globalColors.dart';
import '../global/globalShadow.dart';

class CarTiles extends StatefulWidget {
  const CarTiles({Key? key}) : super(key: key);

  @override
  CarTilesState createState() => CarTilesState();
}
Widget carTiles() {
  return StreamBuilder(
    stream: FirebaseFirestore.instance.collection('rent-details').snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return CircularProgressIndicator();
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else {
        var data = snapshot.data!.docs;
        return Column(
          children: [
            for (int index = 0; index < data.length; index++)
              carTileItem(data[index]),
          ],
        );
      }
    },
  );
}
Widget _carFeatureItem(String feature) {
  return Row(
    children: <Widget>[
      Icon(Icons.check, color: Colors.green),
      SizedBox(width: 8.0),
      Text(
        feature,
        style: TextStyle(fontSize: 10),
      ),
    ],
  );
}
Widget carTileItem(QueryDocumentSnapshot<Object?> carData) {
  String imageUrl = carData.get('img');
  String carmodel = carData.get('model');
  String seatings = carData.get('seatings');

  return Align(
    alignment: Alignment.center,
    child: Container(
      margin: EdgeInsets.only(bottom: 20),
      width: 350,
      child: Container(
        decoration: BoxDecoration(
          color: GlobalColors.boxColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [CustomBoxShadow()],
        ),
        height: 200,
        padding: EdgeInsets.only(top: 10),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 165,
              width: 180,
              child: Image.file(File(imageUrl)),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
                height: 200,
                width: 140,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          carmodel,
                          style: TextStyle(fontSize: 22),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Seatings: $seatings",
                                  style: TextStyle(fontSize: 14),
                                ),
                                Icon(Icons.person),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            _carFeatureItem('Air Conditioning'),
                            _carFeatureItem(
                                'Manual Transmission'),
                            _carFeatureItem('Fuel Policy'),
                            _carFeatureItem('Meet and greet'),
                          ],
                        )
                      ],
                    )
                  ],
                )),
          ],
        ),
      ),
    ),
  );
}

class CarTilesState extends State<CarTiles> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: carTiles(),
    );
  }
}


