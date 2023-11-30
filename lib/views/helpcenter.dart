import 'package:easy_rental_nepal/components/bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../global/globalColors.dart';
import '../global/globalShadow.dart';
import 'contact_us.dart';

class HelpCenter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HelpCenterState();
  }
}

class HelpCenterState extends State<HelpCenter> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Padding(
              padding: EdgeInsets.only(left: 50),
              child: Text(
                "Help Center",
                style: TextStyle(color: Colors.black, fontSize: 28),
              ),
            ),
            leading:
                const Icon(Icons.arrow_back, color: Colors.black, size: 40),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.feedback, color: Colors.black, size: 40),
              )
            ],
            backgroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 15, left: 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Center the contents horizontally
                    children: [
                      GestureDetector(
                        child: const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Feedback",
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: const Padding(
                          padding: EdgeInsets.only(left: 70), // Adjust as needed
                          child: Text(
                            "Contact Us",
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ContactUs()),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    height: 8,
                    width: 130,// Set the desired height of the black bar
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 45, right: 0),
                    child: Column(children: [
                      Container(
                        height: 60,
                        width: 339,
                        margin: const EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                          color: GlobalColors.boxColor,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [CustomBoxShadow()],
                        ),
                        child: Center(
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: 'Enter Feedback Title',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(15),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 200,
                        width: 339,
                        margin: const EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                          color: GlobalColors.boxColor,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [CustomBoxShadow()],
                        ),
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: 'Enter Feedbacks here',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(15),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 45,
                        width: 246,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(176, 0, 0, 0),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [CustomBoxShadow()],
                        ),
                        child: const Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomBar()),
    );
  }
}
