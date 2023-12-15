import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EditProfileState();
  }
}

class EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text(
            "Edit Profile",
            style: TextStyle(color: Colors.black, fontSize: 28),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back, color: Colors.black, size: 40),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.inbox, color: Colors.black, size: 40),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 0),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue[300],
                ),
                child: Center(
                  child: Text(
                    'Your Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              _buildTextFieldContainer("Name"),
              SizedBox(height: 20),
              _buildTextFieldContainer("Email"),
              SizedBox(height: 20),
              _buildTextFieldContainerWithCalendar("Date of Birth"),
              SizedBox(height: 20),
              buildDropdownContainer("Country", ["USA", "Canada", "UK"]),
              SizedBox(height: 20),
              _buildNumberInputContainer("Phone Number"),
              SizedBox(height: 20),
              buildDropdownContainer("Gender", ["Male", "Female", "Other"]),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _buildTextFieldContainer(String label) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 1.2,
      height: size.height / 14,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none, // Remove outline
        ),
      ),
    );
  }

  Widget _buildTextFieldContainerWithCalendar(String label) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 1.2,
      height: size.height / 14,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                labelText: label,
                border: InputBorder.none, // Remove outline
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {
              // Add your calendar logic here
            },
          ),
        ],
      ),
    );
  }

  Widget buildDropdownContainer(String label, List<String> options) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 1.2,
      height: size.height / 14,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: DropdownButtonFormField(
        items: options.map((option) {
          return DropdownMenuItem(
            value: option,
            child: Text(option),
          );
        }).toList(),
        onChanged: (value) {
          // Add your dropdown logic here
        },
        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none, // Remove outline
        ),
      ),
    );
  }

  Widget _buildNumberInputContainer(String label) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 1.2,
      height: size.height / 14,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none, // Remove outline
        ),
      ),
    );
  }
}

void main() {
  runApp(EditProfile());
}
