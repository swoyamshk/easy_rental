import 'package:easy_rental_nepal/components/feedback.dart';
import 'package:flutter/material.dart';
import '../global/globalColors.dart';
import '../components/contact_us.dart';

class HelpCenter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HelpCenterState();
  }
}

class HelpCenterState extends State<HelpCenter> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "Help Center",
              style: TextStyle(color: Colors.white,fontFamily: 'Montserrat', fontSize: 26, fontWeight: FontWeight.normal),
            ),

          ),
          backgroundColor: GlobalColors.fontColor,
          bottom: TabBar(
            indicatorColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            labelColor: Colors.white,
            labelStyle: TextStyle(fontSize: 18,fontFamily: 'Montserrat'),
            tabs: [
              Tab(text: 'Feedback', ),
              Tab(text: 'Contact Us'),
            ],
          ),

        ),
        body: TabBarView(

          children: [
            FeedbackForm(),
            ContactUs()
          ],
        ),
      ),
    );
  }
}
