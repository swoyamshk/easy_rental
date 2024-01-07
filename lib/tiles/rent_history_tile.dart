import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../global/globalColors.dart';
import '../global/globalShadow.dart';

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

void cancelRent(String carId) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  DocumentSnapshot carDocument =
  await firestore.collection('rent-details').doc(carId).get();

  if (carDocument.exists) {
    await firestore.collection('rent-details').doc(carId).update({
      'status': 'cancelled',
    });
  } else {
    print('Car document with ID $carId does not exist.');
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

enum _MenuValues { cancel }

Widget rentTileItem(
    BuildContext context, QueryDocumentSnapshot<Object?> carData) {
  String carmodel = carData.get('model');
  String amount = carData.get('amount');
  String date = carData.get('date');
  String carId = carData.id;
  return Padding(
    padding: const EdgeInsets.only(left: 22, top: 20),
    child: Container(
      height: 92,
      width: 350,
      decoration: BoxDecoration(
        color: GlobalColors.boxColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [CustomBoxShadow()],
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 8, left: 30),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    carmodel,
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.visible, // Handle overflow
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Text(
                    "Rent Date: ",
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rs.$amount",
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 70.0),
              child: PopupMenuButton<_MenuValues>(
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    child: Text(
                      "Cancel Rent",
                      style: TextStyle(fontFamily: 'Montserrat'),
                    ),
                    value: _MenuValues.cancel,
                  )
                ],
                onSelected: (value) {
                  switch (value) {
                    case _MenuValues.cancel:
                      showCancelConfirmationDialog(context, carId);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
void showCancelConfirmationDialog(BuildContext context, String carId) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Cancel Rent"),
        content: Text("Are you sure you want to cancel the rent?"),
        actions: [
          TextButton(
            onPressed: () {
              cancelRent(carId);
              Navigator.pop(context);
            },
            child: Text("Yes"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("No"),
          ),

        ],
      );
    },
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
