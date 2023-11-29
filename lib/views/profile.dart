import 'package:easy_rental_nepal/views/emailSignup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/bottom_bar.dart';
import '../components/signup_tile.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return profileState();
  }
}

class profileState extends State<Profile> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:
        Text("Profile"),
        //bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
