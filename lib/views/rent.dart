import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_rental_nepal/global/globalShadow.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../global/globalColors.dart';

class RentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RentPageState();
  }
}

class RentPageState extends State<RentPage> {
  PlatformFile? pickedFile;

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

  Future uploadFile() async {
    if (pickedFile == null) {
      return "No file picked";
    }

    final path = 'files/${pickedFile!.name}';
    final file = File(pickedFile!.path!);
    final Uint8List fileBytes = await file.readAsBytes();

    final ref = FirebaseStorage.instance.ref().child(path);
    await ref.putData(fileBytes);

    print(ref.fullPath);

    String downloadURL = await ref.getDownloadURL();
    print("File uploaded to: $downloadURL");
    return downloadURL;
  }


  Future<void> saveDetails(
      {required String model,
        required String seatings,
        required String details,
        required String imgPath}) async {
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
        );

        print("Details and image path saved successfully");
      }
    } catch (error) {
      print('Error uploading file or saving details: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            leading:  IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              icon: Icon(Icons.arrow_back, size: 30.0),
            ),
            title: Row(

              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child:
                  Text(
                    "Rent a Car",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: GlobalColors.fontColor,
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
              padding: EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Text('Upload Images'),
                    ),
                  GestureDetector(
                    onTap: () {
                      selectFile();
                    },
                    child: Icon(Icons.file_upload_outlined),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              width: 339,
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                color: GlobalColors.boxColor,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [CustomBoxShadow()],
              ),
              child: TextField(
                controller: detailscontroller,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Enter Car Description',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15),
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
      )),
      //bottomNavigationBar: BottomBar(),
    );
  }
}
