import 'dart:async';
import 'package:easy_rental_nepal/global/globalColors.dart';
import 'package:easy_rental_nepal/views/emailSignup.dart';
import 'package:easy_rental_nepal/views/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      final User? initialUser = FirebaseAuth.instance.currentUser;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => initialUser != null ? Home() : emailSignup(),
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(),));

        },
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 100), // Add some space at the top
                  child:Image.asset(
                    'assets/logo.jpg',
                    width: 500,
                    height: 350,
                  ),
                ),
                SizedBox(height: 100), // Add some space between the images
                const Text(
                  'Easy Rental Nepal',
                  style: TextStyle(
                    fontSize: 36,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: GlobalColors.fontColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



}