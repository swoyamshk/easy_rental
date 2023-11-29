// ignore_for_file: use_build_context_synchronously

import 'package:easy_rental_nepal/views/login.dart';
import 'package:easy_rental_nepal/views/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;


import '../components/signup_tile.dart';

class emailSignup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return emailSignupstate();
  }
}

class emailSignupstate extends State<emailSignup> {
  static const Color fontColor = Color(0xFF234568);
  static const Color boxColor = Color(0xFFF4F4F4);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 30),
                        child: SvgPicture.asset(
                          'assets/arrowback.svg',
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),

                    Image.asset(
                      'assets/logo.png',
                      // Replace with the actual path to your image
                      height: 200, // Adjust the height as needed
                      width: 150, // Adjust the width as needed
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Easy Rental Nepal',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: fontColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      height: size.height / 3,
                      width: size.width / 1.3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            width: 339,
                            margin: const EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                              color: boxColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Center(
                              child: TextField(
                                //controller: emailcontroller,
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  // Add your placeholder text here
                                  border: InputBorder.none,
                                  // Remove the border
                                  contentPadding: EdgeInsets.all(
                                      15), // Adjust the content padding
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 339,
                            margin: const EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                              color: boxColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Center(
                              child: TextField(
                                //controller: emailcontroller,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  // Add your placeholder text here
                                  border: InputBorder.none,
                                  // Remove the border
                                  contentPadding: EdgeInsets.all(
                                      15), // Adjust the content padding
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 339,
                            margin: const EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                              color: boxColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Center(
                              child: TextField(
                                //controller: emailcontroller,
                                decoration: InputDecoration(
                                  hintText: 'Confirm Password',
                                  // Add your placeholder text here
                                  border: InputBorder.none,
                                  // Remove the border
                                  contentPadding: EdgeInsets.all(
                                      15), // Adjust the content padding
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 45,
                                width: 246,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(176, 0, 0, 0),
                                    // 69% black intensity (69% opacity)
                                    borderRadius: BorderRadius.circular(30)),
                                child: const Center(
                                  child: Text(
                                    "SignUp",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey[400],
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text('or continue with',
                              style: TextStyle(
                                  fontSize: 22, color: Colors.grey[400])),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.grey[400],
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SignUpTile(
                          imagePath: 'assets/fb.png',
                          onPressed: () {
                            // Handle Facebook tile press
                            print('Facebook tile pressed');
                          },
                        ),
                        SizedBox(width: 10),
                        SignUpTile(
                          imagePath: 'assets/google1.png',
                          onPressed: () {
                            // Handle Google tile press
                            print('Google tile pressed');
                          },
                        ),
                        SizedBox(width: 10),
                        SignUpTile(
                          imagePath: 'assets/apple.png',
                          onPressed: () {
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Already have an account?',
                          style: TextStyle(fontSize: 16),
                        ),
                        TextButton(
                          child: const Text(
                            'Sign in',
                            style: TextStyle(fontSize: 16),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                        )
                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
