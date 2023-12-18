// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// Widget carTileItem(BuildContext context,
//     QueryDocumentSnapshot<Object?> carData) {
//   String carmodel = carData.get('model');
//   String amount = carData.get('amount');
//   return GestureDetector(
//     onTap: () {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => CarDetailsPage(carData: carData),
//         ),
//       );
//     },
//     child:Padding(
//       padding: const EdgeInsets.only(left: 22, top: 20),
//       child: Container(
//         height: 92,
//         width: 350,
//         decoration: BoxDecoration(
//           color: GlobalColors.boxColor,
//           borderRadius: BorderRadius.circular(30),
//           boxShadow: [CustomBoxShadow()],
//         ),
//         child: Column(
//           children: [Text(carmodel)],
//         ),
//       ),
//     ),
//   );
// }
