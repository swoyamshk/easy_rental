import 'package:flutter/material.dart';

import '../global/globalColors.dart';
import '../global/globalShadow.dart';
import '../modules/rent_history_tile.dart';

class RentHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RentHistoryTiles(context),
    );
  }
}
