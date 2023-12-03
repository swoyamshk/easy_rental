import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_rental_nepal/modules/car_tiles.dart';

import '../global/globalColors.dart';

class BookTiles extends StatefulWidget {
  const BookTiles({Key? key}) : super(key: key);

  @override
  BookTilesState createState() => BookTilesState();
}

class BookTilesState extends State<BookTiles> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading:  IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: Icon(Icons.arrow_back, size: 30.0),
          ),
          backgroundColor: GlobalColors.fontColor,
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child:
              Text(
                "Available vehicles",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.normal,
                ),
              ),
        ),
          ],
        ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 10, bottom: 20),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              bookTiles(),
            ],
          ),
        ),
      ),
    );
  }

  Widget bookTiles() {
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
}
