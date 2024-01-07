

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import '../global/globalColors.dart';
import '../global/globalShadow.dart';
import '../views/confirm_booking.dart';
import '../components/car_feature.dart';

class CarTiles extends StatefulWidget {
  const CarTiles({Key? key}) : super(key: key);

  @override
  CarTilesState createState() => CarTilesState();
}

Widget carTiles(BuildContext context) {
  return StreamBuilder(
    stream: FirebaseFirestore.instance
        .collection('rent-details')
        .where('status', isEqualTo: 'available')
        .snapshots(),
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
              carTileItem(context, data[index]),
          ],
        );
      }
    },
  );
}

Widget carTileItem(BuildContext context, QueryDocumentSnapshot<Object?> carData) {
  String imageUrl = carData.get('img');
  String carmodel = carData.get('model');
  String seatings = carData.get('seatings');
  String vehicletype = carData.get('vehicleType');
  String amount = carData.get('amount');

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
                  child: Image.network(imageUrl),
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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        carmodel,
                        style: TextStyle(fontFamily: 'Montserrat',fontSize: 21),
                      ),
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
                              style: TextStyle(
                                  fontSize: 14, fontFamily: 'Montserrat',color: GlobalColors.fontColor),
                            ),
                            Icon(Icons.person, size: 18,),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Icon(Icons.check, color: Colors.green),
                            SizedBox(width: 8.0),
                            Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Column(
                                children: [
                                  Text(
                                    vehicletype,
                                    style: TextStyle(fontFamily: 'Montserrat',fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        carFeatureItem("Air Conditioning"),
                        carFeatureItem("Meet and PickUp"),
                        const SizedBox(height: 10,),
                        Text("Rs:$amount /per day",style: TextStyle(fontFamily: 'Montserrat',
                            fontSize: 16),)
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


