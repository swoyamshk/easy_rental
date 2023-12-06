import 'package:easy_rental_nepal/maps/mappage.dart';
import 'package:easy_rental_nepal/views/book.dart';
import 'package:easy_rental_nepal/views/bookings.dart';
import 'package:easy_rental_nepal/components/contact_us.dart';
import 'package:easy_rental_nepal/views/emailSignup.dart';
import 'package:easy_rental_nepal/views/helpcenter.dart';
import 'package:easy_rental_nepal/views/home.dart';
import 'package:easy_rental_nepal/views/history.dart';
import 'package:easy_rental_nepal/views/login.dart';
import 'package:easy_rental_nepal/views/profile.dart';
import 'package:easy_rental_nepal/views/rent.dart';

import 'package:flutter/material.dart';

class RouteGen {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => emailSignup());
      case '/login':
        return MaterialPageRoute(builder: (_) => Login());
      case '/home':
        return MaterialPageRoute(builder: (_) => Home());
      case '/history':
        return MaterialPageRoute(builder: (_) => History());
      case '/profile':
        return MaterialPageRoute(builder: (_) => Profile());
      case '/booking':
        return MaterialPageRoute(builder: (_) => Booking());
      case '/helpcenter':
        return MaterialPageRoute(builder: (_) => HelpCenter());
      case '/contact':
        return MaterialPageRoute(builder: (_) => ContactUs());
      case '/rent':
        return MaterialPageRoute(builder: (_) => RentPage());
      case '/map':
        return MaterialPageRoute(builder: (_) => const MapSample());
      case '/book':
        return MaterialPageRoute(builder: (_) => BookTiles());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text("Error")),
        body: Center(
          child: Text("Error"),
        ),
      );
    });
  }
}
