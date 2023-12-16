import 'package:flutter/material.dart';

Widget carFeatureItem(String feature) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Icon(Icons.check, color: Colors.green),
      SizedBox(width: 8.0),
      Padding(
        padding: const EdgeInsets.only(top: 6),
        child: Column(
          children: [
            Text(
              feature,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    ],
  );
}
