import 'package:flutter/material.dart';

import '../components/bottom_bar.dart';

class Inbox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return inboxState();
  }
}

class inboxState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Text("Inbox"),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
