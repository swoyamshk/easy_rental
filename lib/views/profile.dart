import 'package:easy_rental_nepal/views/complete_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';

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
  FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;



    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "Profile",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          backgroundColor: GlobalColors.fontColor,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            // Align children to the start
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 30, top: 25),
                    child: Container(
                      height: 80,
                      width: 80,
                      margin: const EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        color: GlobalColors.boxColor,
                        shape: BoxShape.circle,
                        boxShadow: [CustomBoxShadow()],
                      ),
                      child: user != null && user.photoURL != null
                          ? ClipOval(
                              child: Image.network(
                                user.photoURL!,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Icon(
                              Icons.person,
                              size: 60,
                              color: Colors.black,
                            ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // Align text to the start
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Text(
                          user != null && user.displayName != null
                              ? user.displayName!
                              : "Name",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Text(
                          user != null && user.email != null
                              ? user.email!
                              : "Email",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Divider(height: 2, thickness: 1.5,),
              ),
              SizedBox(height: 8),
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
                      Icon(Icons.person,
                          size: 30, color: GlobalColors.fontColor),
                      // Set the icon color to red
                      SizedBox(width: 10),
                      Text(
                        'Complete Profile ',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
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
                      Icon(Icons.password,
                          size: 30, color: GlobalColors.fontColor),
                      // Set the icon color to red
                      SizedBox(width: 10),
                      Text(
                        'Change Password',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  _navigateToBookingsTab(context);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.history,
                          size: 30, color: GlobalColors.fontColor),
                      // Set the icon color to red
                      SizedBox(width: 10),
                      Text(
                        'View Bookings',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  _navigateToHelpCenterTab(context);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.miscellaneous_services_sharp,
                          size: 30, color: GlobalColors.fontColor),
                      // Set the icon color to red
                      SizedBox(width: 10),
                      Text(
                        'Customer Services',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
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
                  _navigateToHelpCenterTab(context);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.help_center, size: 30, color: GlobalColors.fontColor),
                      SizedBox(width: 10),
                      Text(
                        'Help Center',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
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
                  Navigator.pushNamed(context, '/terms');
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.file_copy,
                          size: 30, color: GlobalColors.fontColor),
                      // Set the icon color to red
                      SizedBox(width: 10),
                      Text(
                        'Terms & Conditions',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
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
                  Dialogbox.logoutDialogueBox(
                      context, "Are you sure you want to Logout?");
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.logout,
                          size: 30, color: GlobalColors.fontColor),
                      // Set the icon color to red
                      SizedBox(width: 10),
                      Text(
                        'Logout',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
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
void _navigateToHelpCenterTab(BuildContext context) {
  final homeState = context.findAncestorStateOfType<HomeState>();
  if (homeState != null) {
    homeState.onTabTapped(2);
  }
}

void _navigateToBookingsTab(BuildContext context) {
  final homeState = context.findAncestorStateOfType<HomeState>();
  if (homeState != null) {
    homeState.onTabTapped(1);
  }
}

