// ignore_for_file: use_build_context_synchronously


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../services/auth_services.dart';
import 'emailSignup.dart';

class signup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return signupstate();

  }
}

class signupstate extends State<signup> {
  //final FirebaseAuthService _auth = FirebaseAuthService();
  static const Color fontColor = Color(0xFF234568);
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/logo.png', // Replace with the actual path to your image
                height: 200, // Adjust the height as needed
                width: 150, // Adjust the width as needed
              ),
              SizedBox(height: 10),
              Text(
                'Easy Rental Nepal',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: fontColor,
                ),
              ),
              SizedBox(height: 10),
              _signUpWithFacebook(),
              SizedBox(height: 10),
              _signUpWithGoogle(),
              SizedBox(height: 10),
              _signUpWithApple(),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text('or', style: TextStyle(fontSize: 27)),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              _signUpWithEmail(),
              SizedBox(height: 10),

            ],
          ),
        ),
      ),
    );
  }

  Widget _signUpWithFacebook() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          side: BorderSide(color: Color(0xFF1877F2)),
          primary: Color(0xFF1877F2),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/fb.png', height: 25, width: 25),
            SizedBox(width: 10),
            Text('Continue with Facebook', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }




  Widget _signUpWithGoogle() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          side: BorderSide(color: Color(0xFFDB4437)),
          primary: Color(0xFFDB4437),
        ),
        onPressed: () {
           signInWithGoogle(context);
          // AuthService().signInWithGoogle();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/google1.png', height: 25, width: 25),
            SizedBox(width: 10),
            Text('Continue with Google', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }

  Widget _signUpWithApple() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          side: BorderSide(color: Color(0xFF000000)),
          primary: Color(0xFF000000),
        ),
        onPressed: () {

        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/apple.png', height: 25, width: 25),
            SizedBox(width: 10),
            Text('Continue with Apple', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }

  Widget _signUpWithEmail() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          side: BorderSide(color: Color(0xFF777777)),
          primary: Color(0xFF777777),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/emailsignup');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.email, color: Color(0xFF777777)),
            SizedBox(width: 10),
            Text('Continue with Email', style: TextStyle(fontSize: 18),),


          ],
        ),
      ),
    );
  }
}
