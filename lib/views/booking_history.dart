import 'package:easy_rental_nepal/modules/car_tiles.dart';
import 'package:easy_rental_nepal/modules/book_history_tile.dart';
import 'package:flutter/material.dart';

import '../global/globalColors.dart';
import '../global/globalShadow.dart';

class BookingHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookHistoryTiles(context),
    );
  }
}
