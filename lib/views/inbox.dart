import 'package:easy_rental_nepal/services/auth_services.dart';
import 'package:flutter/material.dart';


class Inbox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InboxState();
  }
}

class InboxState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 200),
color: Colors.red,
            child: GestureDetector(
              onTap: () {
                print('Tapped on logout icon');
                signOutUser(context);
              },
              child: Icon(Icons.logout),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomBar(),
    );
  }
}
