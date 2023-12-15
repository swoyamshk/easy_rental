import 'package:flutter/material.dart';

class BookingHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 45, right: 0),
        child: Column(
children: [
  Text("Booking History")
],
        ),
      ),
    );
  }
}
