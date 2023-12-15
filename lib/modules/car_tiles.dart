import 'dart:io';


import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import '../global/globalColors.dart';
import '../global/globalShadow.dart';
import '../views/car_details.dart';

class CarTiles extends StatefulWidget {
  const CarTiles({Key? key}) : super(key: key);

  @override
  CarTilesState createState() => CarTilesState();
}
Widget carTiles(BuildContext context) {
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
            for (int index = 0; index < 3; index++)
              carTileItem(context, data[index]),
          ],
        );
      }
    },
  );
}
Widget _carFeatureItem(String feature) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Icon(Icons.check, color: Colors.green),
      SizedBox(width: 8.0),
      Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Text(
          feature,
          style: TextStyle(fontSize: 10),
        ),
      ),
    ],
  );
}
Widget carTileItem(BuildContext context, QueryDocumentSnapshot<Object?> carData) {
  String imageUrl = carData.get('img');
  String carmodel = carData.get('model');
  String seatings = carData.get('seatings');
  return GestureDetector(
    onTap: () {
      // Navigate to car details page and pass car details
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CarDetailsPage(carData: carData),
        ),
      );
    },
    child: Align(
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
                height: 110,
                width: 180,
                child: FittedBox(
                  child: Image.file(File(imageUrl)),
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 200,
                width: 140,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      carmodel,
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Seatings: $seatings",
                              style: TextStyle(fontSize: 14, color: GlobalColors.fontColor),
                            ),
                            Icon(Icons.person, size: 18,),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        _carFeatureItem('Air Conditioning'),
                        _carFeatureItem('Manual Transmission'),
                        _carFeatureItem('Fuel Policy'),
                        _carFeatureItem('Meet and greet'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}


class CarTilesState extends State<CarTiles> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: carTiles(context),
    );
  }
}


