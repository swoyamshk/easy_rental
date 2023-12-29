import 'package:flutter/material.dart';

import '../modules/rent_history_tile.dart';

class RentHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: RentHistoryTiles(context),
      ),
    );
  }
}
