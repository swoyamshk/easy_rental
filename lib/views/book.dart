import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_rental_nepal/tiles/car_tiles.dart';
import '../global/globalColors.dart';

class BookTiles extends StatefulWidget {
  const BookTiles({Key? key}) : super(key: key);

  @override
  BookTilesState createState() => BookTilesState();
}

class BookTilesState extends State<BookTiles> {
  String _searchText = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              icon: Icon(Icons.arrow_back, size: 30.0, color: Colors.white,),
            ),
            backgroundColor: GlobalColors.fontColor,
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Text(
                    "Available vehicles",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                      fontSize: 26,
                      fontWeight: FontWeight.normal,
                        color: Colors.white
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                CarTiles(),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget bookTiles() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('rent-details').where('status', isEqualTo: 'available').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          var data = snapshot.data!.docs;

          // Sort the data alphabetically based on the 'model' field
          data.sort((a, b) => a['model'].toString().compareTo(b['model'].toString()));

          // Filter data based on the search text
          var filteredData = _searchText.isEmpty
              ? data
              : data.where((doc) => doc['model'].toString().toLowerCase().contains(_searchText.toLowerCase())).toList();

          return Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: filteredData.length,
                itemBuilder: (BuildContext context, int index) {
                  return carTileItem(context, filteredData[index]);
                },
              ),
            ],
          );
        }
      },
    );
  }


}
