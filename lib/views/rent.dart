import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_rental_nepal/components/dropDown.dart';
import 'package:easy_rental_nepal/global/globalShadow.dart';
import 'package:easy_rental_nepal/maps/mappage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../components/dialogBox.dart';
import '../global/globalColors.dart';

class RentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RentPageState();
  }
}

class RentPageState extends State<RentPage> {
  PlatformFile? pickedFile;
  LatLng? selectedLocation;

  TextEditingController modelcontroller = TextEditingController();
  TextEditingController seatingscontroller = TextEditingController();
  TextEditingController detailscontroller = TextEditingController();

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }
  Future<void> saveDetails({
    required String model,
    required String seatings,
    required String details,
    required String imgPath,
    LatLng? location,
  }) async {
    try {
      CollectionReference vehiclesCollection =
      FirebaseFirestore.instance.collection('rent-details');
      User? user = FirebaseAuth.instance.currentUser;

      await vehiclesCollection.add({
        'model': model,
        'seatings': seatings,
        'details': details,
        'img': imgPath,
        'userId': user?.uid,
        'location': location != null
            ? GeoPoint(location.latitude, location.longitude)
            : null,
      });
      print('Data added to Firestore successfully');
    } catch (error) {
      print('Error adding data to Firestore: $error');
    }
  }



  Future<void> uploadAndSave() async {
    if (pickedFile == null) {
      print("No file picked");
      return;
    }

    try {
      String imgPath = pickedFile!.path!;

      if (imgPath.isNotEmpty) {
        final model = modelcontroller.text;
        final seatings = seatingscontroller.text;
        final details = detailscontroller.text;

        await saveDetails(
          model: model,
          seatings: seatings,
          details: details,
          imgPath: imgPath,
          location: selectedLocation,
        );

        print("Details and image path saved successfully");
        Dialogbox.confirmDialogueBox(context, "Your Car has been rented");
      }
    } catch (error) {
      print('Error uploading file or saving details: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    String? selectedVehicleType;
    return MaterialApp(
      home: Scaffold(
        appBar:  AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/home');
            },

            icon: Icon(Icons.arrow_back, size: 30.0),

          ),
          backgroundColor: GlobalColors.fontColor,
          title: Text(
            "Rent a Car",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.normal,
            ),
          ),
          // ... (existing code)
        ),

        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 30, left: 20),
          child: Column(
            children: [
              Container(
                height: 50,
                width: 339,
                margin: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: GlobalColors.boxColor,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [CustomBoxShadow()],
                ),
                child: Center(
                  child: TextField(
                    controller: modelcontroller,
                    decoration: InputDecoration(
                      hintText: 'Enter Car Model',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 339,
                margin: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: GlobalColors.boxColor,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [CustomBoxShadow()],
                ),
                child: Center(
                  child: TextField(
                    controller: seatingscontroller,
                    decoration: const InputDecoration(
                      hintText: 'Enter Car Seatings',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 339,
                margin: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: GlobalColors.boxColor,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [CustomBoxShadow()],
                ),
                padding: EdgeInsets.only(left: 15, right: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(pickedFile != null
                          ? 'File Selected: ${pickedFile!.name}'
                          : 'Upload Images'),
                    ),
                    GestureDetector(
                      onTap: () {
                        selectFile();
                      },
                      child: Icon(Icons.file_upload_outlined, size: 25,),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Container(
              //   height: 200,
              //   width: 339,
              //   margin: const EdgeInsets.only(bottom: 15),
              //   decoration: BoxDecoration(
              //     color: GlobalColors.boxColor,
              //     borderRadius: BorderRadius.circular(30),
              //     boxShadow: [CustomBoxShadow()],
              //   ),
              //   child: TextField(
              //     controller: detailscontroller,
              //     keyboardType: TextInputType.multiline,
              //     maxLines: null,
              //     decoration: InputDecoration(
              //       hintText: 'Enter Car Description',
              //       border: InputBorder.none,
              //       contentPadding: EdgeInsets.all(15),
              //     ),
              //   ),
              // ),
              DropDown.buildDropdownContainer(
                context,
                "Select Vehicle Type",
                ["Petrol", "Electric", "Diesel"],
                selectedVehicleType,
                    (String? newValue) {
                  setState(() {
                    selectedVehicleType = newValue;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 339,
                margin: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: GlobalColors.boxColor,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [CustomBoxShadow()],
                ),
                padding: EdgeInsets.only(left: 15, right: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        selectedLocation != null
                            ? 'Selected Location: $selectedLocation'
                            : 'Select Location',
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final location = await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MapSample()),
                        );
                        if (location != null) {
                          setState(() {
                            selectedLocation = location as LatLng;
                          });
                          print('Received location in RentPage: $location');
                        }
                      },
                      child: Icon(Icons.edit),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      uploadAndSave();
                    },
                    child: Container(
                      height: 45,
                      width: 246,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(176, 0, 0, 0),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [CustomBoxShadow()],
                      ),
                      child: const Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

