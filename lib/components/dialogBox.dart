import 'package:flutter/material.dart';

import '../services/auth_services.dart';

class Dialogbox {
  static warningDialogueBox(context, String heading, String message) {
    return showDialog(
        context: context,
        builder: (BuildContext context)
        {
          return AlertDialog(

            title: Text(heading),
            content: Text(message),
            actions: [
              TextButton(child: const Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },)
            ],
          );
        }
    );
  }
  static confirmDialogueBox(context, String message) {
    return showDialog(
        context: context,
        builder: (BuildContext context)
        {
          return AlertDialog(

            title: const Text("Confirmed"),
            content: Text(message),
            actions: [
              TextButton(child: const Text("OK"),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },)
            ],
          );
        }
    );
  }
  static logoutDialogueBox(context, String message) {
    return showDialog(
        context: context,
        builder: (BuildContext context)
        {
          return AlertDialog(

            title: const Text("Are you sure you want to Logout?"),
            content: Text(message),
            actions: [
              TextButton(child: const Text("Yes"),
                onPressed: () {
                  signOutUser(context);
                },),
              TextButton(child: const Text("No"),
                onPressed: () {
                  Navigator.pop(context); // Go back to the same page
                },)
            ],
          );
        }
    );
  }
  static okDialogueBox(context, String message) {
    return showDialog(
        context: context,
        builder: (BuildContext context)
        {
          return AlertDialog(

            title: const Text("Confirmed"),
            content: Text(message),
            actions: [
              TextButton(child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },)
            ],
          );
        }
    );
  }

}