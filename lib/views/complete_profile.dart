  import 'package:cloud_firestore/cloud_firestore.dart';
  import 'package:flutter/material.dart';

  import '../components/dialogBox.dart';
import '../components/profiledropdown.dart';
import '../global/globalColors.dart';
  import '../global/globalShadow.dart';
  Future<void> saveProfile({
    required BuildContext context,
    required String name,
    required String dob,
    required String country,
    required String gender,
    required String contact,


  }) async {
    try {
      CollectionReference vehiclesCollection =
      FirebaseFirestore.instance.collection('profile');

      await vehiclesCollection.add({
        'name': name,
        'dob': dob,
        'country': country,
        'gender': gender,
        'contact': contact,

      });
      Dialogbox.okDialogueBox(context, "Your profile has been updated ");
      print('Data added to Firestore successfully');
    } catch (error) {
      print('Error adding data to Firestore: $error');
    }
  }

  class EditProfile extends StatefulWidget {


    @override
    State<StatefulWidget> createState() {
      return EditProfileState();
    }
  }

  class EditProfileState extends State<EditProfile> {
    DateTime selectedDate = DateTime.now();
    TextEditingController datecontroller = TextEditingController();
    final TextEditingController namecontroller = TextEditingController();
    final TextEditingController countrycontroller = TextEditingController();
    final TextEditingController gendercontroller = TextEditingController();

    late String selectedCountry;
    List<String> countries = [
      'Country 1',
      'Country 2',
      'Country 3',
      // Add more countries as needed
    ];// Initialize selectedDate

    Future<void> _selectDate(BuildContext context) async {
      DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2101),
      );

      if (picked != null && picked != DateTime.now()) {
        setState(() {
          datecontroller.text =
          "${picked.toLocal().day}-${picked.toLocal().month}-${picked.toLocal().year}";
        });
      }
    }



    @override
    Widget build(BuildContext context) {

      final TextEditingController contactcontroller = TextEditingController();

      String? selectedCountry;
      String? selectedgender;
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Complete Profile",
              style: TextStyle(color: Colors.black, fontSize: 28),
            ),
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back, color: Colors.black, size: 40),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.inbox, color: Colors.black, size: 40),
                onPressed: () {
                  // Add your inbox logic here
                },
              ),
            ],
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 32, top: 10),
                  child: Container(
                    height: 120,
                    width: 120, // Adjust the width to make it a perfect circle
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      color: GlobalColors.boxColor,
                      shape: BoxShape.circle,
                      boxShadow: [CustomBoxShadow()],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.person, // Replace with the desired icon
                        size: 60, // Adjust the size of the icon
                        color: Colors.black, // Adjust the color of the icon
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32, top: 15),
                  child: Container(
                    height: 60,
                    width: 339,
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      color: GlobalColors.boxColor,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [CustomBoxShadow()],
                    ),
                    child: Center(
                      child: TextField(
                        controller: namecontroller,
                        decoration: const InputDecoration(
                          hintText: ' Name',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(15),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32, top: 15),
                  child: Container(
                    height: 60,
                    width: 339,
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      color: GlobalColors.boxColor,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [CustomBoxShadow()],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(

                            controller: datecontroller,
                            decoration: const InputDecoration(
                              hintText: 'Date of Birth',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(15),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: IconButton(
                            icon: Icon(
                              Icons.calendar_today,
                              color: Colors.grey,
                            ),
                            onPressed: () => _selectDate(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32, top: 15),
                  child: ProfileDropDown.buildDropdownContainer(
                    context,
                    "Country",
                    ["1", "2", "3","4", "5+"],
                    selectedCountry,
                        (String? newValue) {
                      setState(() {
                        selectedCountry = newValue;
                        countrycontroller.text = newValue ?? "";
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32, top: 15),
                  child: ProfileDropDown.buildDropdownContainer(
                    context,
                    "Your Gender",
                    ['Male','Female','Other'],
                    selectedgender,
                        (String? newValue) {
                      setState(() {
                        selectedgender = newValue;
                        gendercontroller.text = newValue ?? "";
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32, top: 15),
                  child: Container(
                    height: 60,
                    width: 339,
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      color: GlobalColors.boxColor,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [CustomBoxShadow()],
                    ),
                    child: Center(
                      child: TextField(
                        controller: contactcontroller,
                        decoration: const InputDecoration(
                          hintText: 'Contact',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(15),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32, top: 15),
                  child: GestureDetector(
                    onTap: (){
                      saveProfile(context:context,name: namecontroller.text, dob: datecontroller.text, country: countrycontroller.text, gender: gendercontroller.text, contact: contactcontroller.text, );

                    },
                    child: Container(
                      height: 60,
                      width: 239,
                      margin: const EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [CustomBoxShadow()],
                      ),
                      child: Center(
                        child: Text("Submit"
                        ),
                      ),
                      // Add child widgets or content here if needed
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
