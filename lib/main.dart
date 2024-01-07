import 'package:easy_rental_nepal/route.dart';
import 'package:easy_rental_nepal/views/emailSignup.dart';
import 'package:easy_rental_nepal/components/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  User? user = FirebaseAuth.instance.currentUser;
  runApp(MyApp(initialUser: user));
}

class MyApp extends StatelessWidget {
  final User? initialUser;

  const MyApp({Key? key, this.initialUser}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: initialUser != null ? SplashScreen() : emailSignup(),
      onGenerateRoute: RouteGen.generateRoute,
    );
  }
}

