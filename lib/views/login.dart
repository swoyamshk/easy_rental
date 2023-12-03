import 'package:easy_rental_nepal/components/dialogBox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../global/globalColors.dart';
import '../global/globalShadow.dart';
import '../services/auth_services.dart';

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
  bool isPasswordVisible = false;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  readfromstorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');
    var password = prefs.getString('password');

    if (email == null) {
    } else {
      setState(() {
        emailcontroller.text = email.toString();
        passwordcontroller.text = password.toString();
        isloading = true;
      });
    }
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      UserCredential userCredential =
      await _firebaseAuth.signInWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordcontroller.text.trim(),
      );
      Navigator.pushNamed(context, '/home');
      print('User ID: ${userCredential.user?.uid}');
    }
     catch (e) {
      print('Generic Exception: $e');
      Dialogbox.warningDialogueBox(context, "Your Email and Password do not match");
    }
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    readfromstorage();
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 70),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 320),
                  child: IconButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/');
                    },
                    icon: new Icon(Icons.arrow_back, size: 30.0),
                  ),
                ),
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
                          boxShadow: [CustomBoxShadow()]
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
                          boxShadow: [CustomBoxShadow()]
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
                                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              signInWithEmailAndPassword();
                            },
                            child: Container(
                              height: 45,
                              width: 246,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(176, 0, 0, 0),
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [CustomBoxShadow()]
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
                        'or',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.grey[600],
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
               _signUpWithGoogle()
              ],
            ),
          ),
        ),
        //bottomNavigationBar: BottomBar(),
      ),
    );
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
            Text('Continue with Google', style: TextStyle(fontSize: 18,color: Colors.black87),),
          ],
        ),
      ),
    );
  }
}
