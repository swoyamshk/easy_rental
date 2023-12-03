// ignore_for_file: use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../global/globalColors.dart';
import '../global/globalShadow.dart';
import '../services/auth_services.dart';

class emailSignup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return emailSignupstate();
  }
}

class emailSignupstate extends State<emailSignup> {
  static const Color fontColor = Color(0xFF234568);
  static const Color boxColor = Color(0xFFF4F4F4);

  bool isPasswordVisible = false;

  final FirebaseAuthServices _auth = FirebaseAuthServices();

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController passwordCcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
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
                                boxShadow: [CustomBoxShadow()],
                              ),
                              child: Center(
                                child: TextField(
                                  controller: emailcontroller,
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(15),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Container(
                              height: 50,
                              width: 339,
                              margin: const EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                color: GlobalColors.boxColor,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [CustomBoxShadow()],
                              ),
                              child: TextField(
                                controller: passwordcontroller,
                                obscureText: !isPasswordVisible,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(15),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isPasswordVisible = !isPasswordVisible;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Container(
                              height: 50,
                              width: 339,
                              margin: const EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                  color: GlobalColors.boxColor,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [CustomBoxShadow()]),
                              child: TextField(
                                controller: passwordCcontroller,
                                obscureText: !isPasswordVisible,
                                decoration: InputDecoration(
                                  hintText: 'Confirm',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(15),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isPasswordVisible = !isPasswordVisible;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _signup();
                                  },
                                  child: Container(
                                    height: 45,
                                    width: 246,
                                    decoration: BoxDecoration(
                                        color:
                                            const Color.fromARGB(176, 0, 0, 0),
                                        borderRadius: BorderRadius.circular(30),
                                        boxShadow: [CustomBoxShadow()]),
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
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
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
                            child: Text('or',
                                style: TextStyle(
                                    fontSize: 22, color: Colors.grey[600])),
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
                      _signUpWithGoogle(),
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signup() async {
    String password = passwordcontroller.text;
    String confirmPassword = passwordCcontroller.text;
    String email = emailcontroller.text;

    if (password == confirmPassword) {
      User? user = await _auth.signUp(email, password);

      if (user != null) {
        print("User successfully registered");
        Navigator.pushNamed(context, "/login");
      } else {
        print("Error registering user");
      }
    } else {
      print("Passwords do not match");
    }
  }

  Widget _signUpWithGoogle() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          side: BorderSide(color: Colors.black12),
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
            const Text(
              'Continue with Google',
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
