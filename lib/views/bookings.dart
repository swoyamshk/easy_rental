import 'package:flutter/material.dart';


class Booking extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return bookingState();
  }
}

class bookingState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:
        Text("Booking"),
      ),
    );
  }
}
