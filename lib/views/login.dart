import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/signup_tile.dart';
import '../global/globalColors.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return loginState();
  }
}

class loginState extends State<Login> {
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();

  bool isloading = false;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  readfromstorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');
    var password = prefs.getString('password');

    if (email == null) {
      // stay idle
    } else {
      setState(() {
        emailcontroller.text = email.toString();
        passwordcontroller.text = password.toString();
        //loading
        isloading = true;
      });
      // login success, go to detail page
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => Signup()),
      // );
      // Alternatively, you can call the login function here
    }
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordcontroller.text.trim(),
      );
      Navigator.pushNamed(context, '/emailsignup');
      print('User ID: ${userCredential.user?.uid}');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    readfromstorage();
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 100),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/logo.png',
                  height: 200,
                  width: 150,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Easy Rental Nepal',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: GlobalColors.fontColor,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  height: size.height / 4.5,
                  width: size.width / 1.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 50,
                        width: 339,
                        margin: const EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                          color: GlobalColors.boxColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: TextField(
                            controller: emailcontroller,
                            decoration: const InputDecoration(
                              hintText: 'Email',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(15),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 339,
                        margin: const EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                          color: GlobalColors.boxColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: TextField(
                            controller: passwordcontroller,
                            decoration: const InputDecoration(
                              hintText: 'Password',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(15),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/home');
                            },
                            child: Container(
                              height: 45,
                              width: 246,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(176, 0, 0, 0),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
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
                      child: Text(
                        'or continue with',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey[400],
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
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
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        //bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
