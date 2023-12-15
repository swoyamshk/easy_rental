import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../global/globalShadow.dart';

class OrderSuccessScreen extends StatelessWidget{
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Image.asset("assets/success.png", height: 200,),
              Text("Success!", style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),),
              const SizedBox(height: 20,),
              Text("The Car will be on the way.",style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              )),
              const SizedBox(height: 10,),
              Text("Thank you for choosing our app.",style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              )),

            ],

          ),
          const SizedBox(height: 10,),
          GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed('/home');
            },
            child: Padding(padding: EdgeInsets.all(20),
            child:  Container(
              height: 45,
              width: 300,
              decoration: BoxDecoration(
                color: const Color.fromARGB(176, 0, 0, 0),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [CustomBoxShadow()],
              ),
              child: const Center(
                child: Text(
                  "Continue Browsing",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),),
          )

        ],
      ),
    );

  }
}