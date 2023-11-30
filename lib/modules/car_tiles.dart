import 'package:flutter/material.dart';

import '../global/globalColors.dart';
import '../global/globalShadow.dart';

class CarTiles extends StatefulWidget {
  const CarTiles({super.key});

  @override
  CarTilesState createState() => CarTilesState();
}

class CarTilesState extends State<CarTiles> {
  @override
  Widget build(BuildContext context) {
    return carTiles();
  }
  Widget _carFeatureItem(String feature) {
    return Row(
      children: <Widget>[
        Icon(Icons.check, color: Colors.green),
        SizedBox(width: 8.0),
        Text(feature, style: TextStyle(fontSize: 10),),

      ],
    );
  }

  Widget carTiles() {
    return Container(
        decoration: BoxDecoration(
          color: GlobalColors.boxColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [CustomBoxShadow()],
        ),
        height: 200,
        width: 350,
        padding: EdgeInsets.only(top: 10),
        child: Row(
            children: [
              const SizedBox(width: 10,),
              Container(
                height:165,
                width: 180,
                child: Image.asset(
                  'assets/mercedes.png',
                  height: 200,
                  width: 150,
                ),
              ),
          const SizedBox(width: 10,),
          Container(
            height: 200,
            width: 140,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "Mercedes",
                      style: TextStyle(fontSize: 22),
                    ),
                    const SizedBox(height: 8,),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Seatings: 3",
                              style: TextStyle(fontSize: 14),
                            ),
                            Icon(Icons.person),
                          ],
                        ),
                        const SizedBox(height: 8,),
                        _carFeatureItem('Air Conditioning'),
                        _carFeatureItem('Manual Transmission'),
                        _carFeatureItem('Fuel Policy'),
                        _carFeatureItem('Meet and greet'),
                      ],
                    )

                  ],
                )
              ],
            ),
          ),
        ]));
  }
}
