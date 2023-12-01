import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


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
    // Handle sign-out errors if needed
  }
}
class FirebaseAuthServices {
  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential credential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Error Signing Up");
    }
    return null;
  }
}