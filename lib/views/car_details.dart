import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_rental_nepal/views/success.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import '../global/globalColors.dart';
import '../global/globalShadow.dart';

class CarDetailsPage extends StatefulWidget {
  final QueryDocumentSnapshot<Object?> carData;

  const CarDetailsPage({Key? key, required this.carData}) : super(key: key);

  @override
  _CarDetailsPageState createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage> {
  int? value = 1; // Make it nullable

  final paymentLabels = ['Cash on Delivery', 'Debit/Credit Card', 'e-Wallet'];
  final paymentIcons = [Icons.money_off, Icons.credit_card, Icons.wallet];

  @override
  Widget build(BuildContext context) {
    String imageUrl = widget.carData.get('img');
    String carmodel = widget.carData.get('model');
    String seatings = widget.carData.get('seatings');

    return Scaffold(
      appBar: AppBar(
        title: Text(carmodel),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                const SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  carmodel,
                                  style: TextStyle(fontSize: 22),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Seatings: $seatings",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: GlobalColors.fontColor),
                                        ),
                                        Icon(Icons.person, size: 18,),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),

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
          ),
          Container(
            height: 122,
            width: 350,
            decoration: BoxDecoration(
              color: GlobalColors.boxColor,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [CustomBoxShadow()],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left:40,top:10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                children: [
                  Text("Amount:", style: TextStyle(fontSize: 22)),
                  const SizedBox(height: 10),
                  Text("Tax:", style: TextStyle(fontSize: 22)),
                  const SizedBox(height: 10),
                  Text("Amount:", style: TextStyle(fontSize: 22)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Container(
            height: 47,
            width: 340,
            decoration: BoxDecoration(
              color: GlobalColors.boxColor,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [CustomBoxShadow()],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                children: [
                  Text("Total:", style: TextStyle(fontSize: 22)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10,),
          // Text('Choose your payment method'),
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: paymentLabels.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Radio(
                    value: index,
                    groupValue: value,
                    onChanged: (int? i) {
                      setState(() {
                        value = i;
                      });
                    },
                  ),
                  title: Text(
                    paymentLabels[index],
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: Icon(paymentIcons[index], color: Colors.black),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 1.5,
                );
              },
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderSuccessScreen()),
              );
            },
            child: Container(
              height: 45,
              width: 246,
              decoration: BoxDecoration(
                color: const Color.fromARGB(176, 0, 0, 0),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [CustomBoxShadow()],
              ),
              child: const Center(
                child: Text(
                  "Submit",
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
    );
  }
}
