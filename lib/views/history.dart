import 'package:easy_rental_nepal/views/booking_history.dart';
import 'package:easy_rental_nepal/views/rent_history.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../global/globalColors.dart';

class History extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HistoryState();
  }
}

class HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "History",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              backgroundColor: GlobalColors.fontColor,
              bottom: TabBar(
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white60,
                labelStyle: TextStyle(fontSize: 18),
                tabs: [
                  Tab(
                    text: 'Rent History',
                  ),
                  Tab(text: 'Booking History' ),
                ],
              ),
            ),
            body: TabBarView(children: [RentHistory(), BookingHistory() ])));
  }
}
