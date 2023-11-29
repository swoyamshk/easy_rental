
import 'package:easy_rental_nepal/maps/mappage.dart';
import 'package:easy_rental_nepal/views/bookings.dart';
import 'package:easy_rental_nepal/views/contact_us.dart';
import 'package:easy_rental_nepal/views/emailSignup.dart';
import 'package:easy_rental_nepal/views/home.dart';
import 'package:easy_rental_nepal/views/inbox.dart';
import 'package:easy_rental_nepal/views/login.dart';
import 'package:easy_rental_nepal/views/profile.dart';
import 'package:easy_rental_nepal/views/signup.dart';
import 'package:flutter/material.dart';

class RouteGen{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => signup());
      case '/emailsignup':
        return MaterialPageRoute(builder: (_) => emailSignup());
      case '/login':
        return MaterialPageRoute(builder: (_) => Login());
      case '/home':
        return MaterialPageRoute(builder: (_) => Home());
      case '/inbox':
        return MaterialPageRoute(builder: (_) => Inbox());
      case '/profile':
        return MaterialPageRoute(builder: (_) => Profile());
      case '/booking':
        return MaterialPageRoute(builder: (_) => Booking());
      case '/contact':
        return MaterialPageRoute(builder: (_) => Contact());
      case '/map':
        return MaterialPageRoute(builder: (_) => const MapSample());


      default:
        return _errorRoute();
    }
  }
  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
            title: Text("Error")),
        body: Center(
          child: Text("Error"),
        ),
      );
    }
    );

  }
}

