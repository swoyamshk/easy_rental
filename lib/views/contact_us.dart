import 'package:flutter/material.dart';

import '../main.dart';

void main() {
  runApp(MyApp());
}


class Contact extends StatefulWidget {



  @override
  ContactState createState() => ContactState();
}

class ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.feedback),
            title: Text('Feedback'),
          ),
          ListTile(
            leading: Icon(Icons.support_agent),
            title: Text('Customer Support'),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('WhatsApp'),
          ),
          ListTile(
            leading: Icon(Icons.facebook),
            title: Text('Facebook'),
          ),
          ListTile(
            leading: Icon(Icons.photo_library),
            title: Text('Instagram'),
          ),
          ListTile(
            leading: Icon(Icons.web),
            title: Text('Website'),
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text('Contact Us'),
          ),
          ListTile(
            leading: Icon(Icons.facebook),
            title: Text('Twitter'),
          ),
        ],
      ),
    );
  }
}