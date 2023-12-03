import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/contact_us.dart';
import '../components/feedback.dart';
import '../global/globalColors.dart';
import '../modules/message.dart';
import '../services/auth_services.dart';

class Inbox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InboxState();
  }
}

class InboxState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "History",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.normal,
                ),
              ),
              backgroundColor: GlobalColors.fontColor,
              bottom: TabBar(
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                labelStyle: TextStyle(fontSize: 18),
                tabs: [
                  Tab(text: 'Rent History', ),
                  Tab(text: 'Booking History'),
                ],
              ),
            ),
            body: TabBarView(
                children: [
                  FeedbackForm(),
                  ContactUs()
                ]
            )
        )
    );
  }
}
