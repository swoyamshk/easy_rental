import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../components/dialogBox.dart';


final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

signInWithGoogle(context)async{

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  _googleSignIn.signOut();
  try{
    final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

    if(googleSignInAccount != null){
      final GoogleSignInAuthentication googleSignInAuthentication = await
      googleSignInAccount.authentication;


      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,

      );

      var login = await _firebaseAuth.signInWithCredential(credential);
      print("Firebase Sign-In Result: ${login.toString()}");
      if(login.user != null){
        Navigator.of(context).pushNamed('/home');
      }
    }

  }
  catch (e) {
    print("Error during Google Sign-In: $e");
  }

}
void signOutUser(BuildContext context) async {
  try {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, '/login');
  } catch (e) {
    print("Error signing out: $e");
  }
}
class FirebaseAuthServices {
  Future<User?> signUp(String email, String password, String name) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      // Set the display name
      if (user != null) {
        await user.updateProfile(displayName: name);
      }

      return user;
    } catch (e) {
      print("Error signing up: $e");
      return null;
    }
  }
}
Future<User?> signUp(String email, String password, String displayName) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    User? user = userCredential.user;

    // Set the display name
    if (user != null) {
      await user.updateProfile(displayName: displayName);
      Dialogbox.confirmDialogueBox(context, "Your Car has been rented");
    }

    return user;
  } catch (e) {
    print("Error signing up: $e");
    return null;
  }
}
