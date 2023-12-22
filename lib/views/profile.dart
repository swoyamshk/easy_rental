import 'package:easy_rental_nepal/views/complete_profile.dart';
import 'package:easy_rental_nepal/views/helpcenter.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/dialogBox.dart';
import '../global/globalColors.dart';
import '../global/globalShadow.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfileState();
  }
}

class ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "Profile",
              style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.normal),
            ),

          ),
          backgroundColor: GlobalColors.fontColor,

        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              Padding(
                padding: const EdgeInsets.only(right: 30, top: 25),
                child: Container(
                  height: 100,
                  width: 100, // Adjust the width to make it a perfect circle
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    color: GlobalColors.boxColor,
                    shape: BoxShape.circle,
                    boxShadow: [CustomBoxShadow()],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.person, // Replace with the desired icon
                      size: 60, // Adjust the size of the icon
                      color: Colors.black, // Adjust the color of the icon
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10), // Add a spacing of 10 pixels between the blue circle and the new container
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfile()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.person, size: 30, color: Colors.red), // Set the icon color to red
                      SizedBox(width: 10),
                      Text(
                        'Complete Your Profile ',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.password, size: 30, color: Colors.red), // Set the icon color to red
                      SizedBox(width: 10),
                      Text(
                        'Change Password',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.history, size: 30, color: Colors.red), // Set the icon color to red
                      SizedBox(width: 10),
                      Text(
                        'View Bookings',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.miscellaneous_services_sharp, size: 30, color: Colors.red), // Set the icon color to red
                      SizedBox(width: 10),
                      Text(
                        'Customer Services',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  HelpCenter();
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.help_center, size: 30, color: Colors.red), // Set the icon color to red
                      SizedBox(width: 10),
                      Text(
                        'Help Center',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('Tapped on logout icon');
                  Dialogbox.logoutDialogueBox(context, "Are you sure you want to Logout?");

                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.logout, size: 30, color: Colors.red), // Set the icon color to red
                      SizedBox(width: 10),
                      Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}