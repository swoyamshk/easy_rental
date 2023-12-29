import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../global/globalColors.dart';
import '../global/globalShadow.dart';
import '../views/confirm_booking.dart';

class RentTiles extends StatefulWidget {
  const RentTiles({Key? key}) : super(key: key);

  @override
  RentHistoryTilesState createState() => RentHistoryTilesState();
}

Future<String> getCurrentUserId() async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    return user.uid;
  } else {
    return '';
  }
}

Widget RentHistoryTiles(BuildContext context) {
  return FutureBuilder<String>(
    future: getCurrentUserId(),
    builder: (BuildContext context, AsyncSnapshot<String> userIdSnapshot) {
      if (userIdSnapshot.connectionState == ConnectionState.waiting) {
        return CircularProgressIndicator();
      } else if (userIdSnapshot.hasError) {
        return Text('Error: ${userIdSnapshot.error}');
      } else {
        String userId = userIdSnapshot.data ?? '';
        return StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('rent-details')
              .where('userId', isEqualTo: userId)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              var data = snapshot.data!.docs;
              return Column(
                children: [
                  for (int index = 0; index < data.length; index++)
                    rentTileItem(context, data[index]),
                ],
              );
            }
          },
        );
      }
    },
  );
}

Widget rentTileItem(
    BuildContext context, QueryDocumentSnapshot<Object?> carData) {
  String carmodel = carData.get('model');
  String amount = carData.get('amount');
  String date = carData.get('date');
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CarDetailsPage(carData: carData),
        ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.only(left: 22, top: 20),
      child: Container(
        height: 92,
        width: 350,
        decoration: BoxDecoration(
          color: GlobalColors.boxColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [CustomBoxShadow()],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            carmodel,
                            style: TextStyle(fontSize: 22,fontFamily: 'Montserrat', fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 13,),
                          Text(
                            "Rent Date: ",
                            style: TextStyle(fontSize: 17,fontFamily: 'Montserrat', fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      const SizedBox(width: 60),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            Text(
                              "Rs.$amount",
                              style: TextStyle(fontSize: 22,fontFamily: 'Montserrat', fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 13,),
                            Text(
                              date,
                              style: TextStyle(fontSize: 17,fontFamily: 'Montserrat', fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),

                    ],
                  )),
            )
          ],
        ),
      ),
    ),
  );
}

class RentHistoryTilesState extends State<RentTiles> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: RentHistoryTiles(context),
    );
  }
}
