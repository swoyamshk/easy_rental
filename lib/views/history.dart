import 'package:easy_rental_nepal/views/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/feedback.dart';
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
                    fontSize: 26,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              backgroundColor: GlobalColors.fontColor,
              bottom: TabBar(
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                labelStyle: TextStyle(fontSize: 18),
                tabs: [
                  Tab(
                    text: 'Rent History',
                  ),
                  Tab(text: 'Booking History'),
                ],
              ),
            ),
            body: TabBarView(children: [FeedbackForm(), Profile()])));
  }
}