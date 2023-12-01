import 'package:flutter/material.dart';

class Dialogbox {
  static warningDialogueBox(context, String message) {
    return showDialog(
        context: context,
        builder: (BuildContext context)
        {
          return AlertDialog(

            title: const Text("Login Failed"),
            content: Text(message),
            actions: [
              TextButton(child: const Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },)
            ],
          );
        }
    );}
}