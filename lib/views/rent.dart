import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_rental_nepal/components/dropDown.dart';
import 'package:easy_rental_nepal/global/globalShadow.dart';
import 'package:easy_rental_nepal/maps/mappage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'dart:io';

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
  TextEditingController vehicleTypecontroller= TextEditingController();
  TextEditingController amountcontroller = TextEditingController();

  String _formatDate(DateTime date) {
    final dateFormat = DateFormat('dd MMM', 'en_US');
    return dateFormat.format(date);
  }
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }


  Future<void> uploadFile() async {
    if (pickedFile == null) {
      Dialogbox.warningDialogueBox(context, "Error", "Please select an image.");
      return;
    }
    try {
      // Show loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 10),
                Text("Saving data..."),
              ],
            ),
          );
        },
      );

      String imgPath = pickedFile!.path!;
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();

      Reference storageReference =
      FirebaseStorage.instance.ref().child('images/$fileName');

      await storageReference.putFile(File(imgPath));
      String fileUrl = await storageReference.getDownloadURL();

      // Save the file URL along with other details
      final model = modelcontroller.text;
      final seatings = seatingscontroller.text;
      final vehicletype = vehicleTypecontroller.text;
      final amount = amountcontroller.text;

      await saveDetails(
        model: model,
        seatings: seatings,
        imgPath: fileUrl,
        location: selectedLocation,
        vehicleType: vehicletype,
        amount: amount,
        status: 'available',
      );

      print("Details and image URL saved successfully");

      // Dismiss loading indicator
      Navigator.pop(context);

      Dialogbox.confirmDialogueBox(context, "Your Car has been rented");
    } catch (error) {
      print('Error uploading file or saving details: $error');
      // Dismiss loading indicator on error
      Navigator.pop(context);
    }
  }


  Future<void> saveDetails({
    required String model,
    required String seatings,
    required String imgPath,
    required String status,
    required String vehicleType,
    required String amount,
    LatLng? location,
  }) async {
    try {
      CollectionReference vehiclesCollection =
      FirebaseFirestore.instance.collection('rent-details');
      User? user = FirebaseAuth.instance.currentUser;

      String formattedDate = _formatDate(DateTime.now());

      await vehiclesCollection.add({
        'model': model,
        'seatings': seatings,
        'img': imgPath,
        'userId': user?.uid,
        'status': 'available',
        'vehicleType': vehicleType,
        'amount': amount,
        'date': formattedDate,
        'location': location != null
            ? GeoPoint(location.latitude, location.longitude)
            : null,
      });
      print('Data added to Firestore successfully');
    } catch (error) {
      print('Error adding data to Firestore: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    String? selectedVehicleType;
    String? selectedSeating;
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/home');
            },
            icon: Icon(Icons.arrow_back, size: 30.0, color: Colors.white,),
          ),
          backgroundColor: GlobalColors.fontColor,
          title: Text(
            "Rent a Car",
            style: TextStyle(
                fontFamily: 'Montserrat',
              fontSize: 26,
              fontWeight: FontWeight.normal,
              color: Colors.white
            ),
          ),
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
                      hintStyle: TextStyle(
                        fontFamily: 'Montserrat', // You can apply other styles as needed
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              DropDown.buildDropdownContainer(
                context,
                "Enter Car Seatings",
                ["1", "2", "3","4", "5+"],
                selectedSeating,
                    (String? newValue) {
                  setState(() {
                    selectedVehicleType = newValue;
                    seatingscontroller.text = newValue ?? "";
                  });
                },
              ),
              const SizedBox(
                height: 26,
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
                          : 'Upload Images', style: TextStyle(fontFamily: 'Montserrat', fontSize: 17, color: Colors.black45),),
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
                height: 15,
              ),
              DropDown.buildDropdownContainer(
                context,
                "Select Vehicle Type",
                ["Petrol", "Electric", "Diesel"],
                selectedVehicleType,
                    (String? newValue) {
                  setState(() {
                    selectedVehicleType = newValue;
                    vehicleTypecontroller.text = newValue ?? "";
                  });
                },
              ),
              const SizedBox(
                height: 30,
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
                            : 'Select Location', style: TextStyle(fontFamily: 'Montserrat', fontSize: 17, color: Colors.black45)
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
                    controller: amountcontroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter Car Charges per day',
                      hintStyle: TextStyle(
                        fontFamily: 'Montserrat',
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      uploadFile();
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
                            fontFamily: 'Montserrat',
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
