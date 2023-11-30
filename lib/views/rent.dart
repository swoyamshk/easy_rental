import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_rental_nepal/global/globalShadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../components/bottom_bar.dart';
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
      // Reference to the Firestore collection
      CollectionReference vehiclesCollection =
      FirebaseFirestore.instance.collection('rent-details');

      await vehiclesCollection.add({
        'model': model,
        'seatings': seatings,
        'details': details,
        'img': imgPath,
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
      // Use pickedFile.path directly
      String imgPath = pickedFile!.path!;

      // Ensure the file path is not empty before saving details
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
          body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 80, left: 20),
        child: Column(children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/arrowback.svg',
                height: 30,
                width: 30,
              ),
              Text(
                "Rent a vehicle",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
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
              // if (pickedFile != null)
              //   Column(
              //     children: [
              //       Image.network('https://firebasestorage.googleapis.com/v0/b/easyrental-c1e2f.appspot.com/o/files%2FScreenshot%202023-11-29%20151608.png?alt=media&token=fbe1a337-6bba-47bf-9263-b9febab469c3'),
              //       // Image.file(
              //       //   File(pickedFile?.path ?? ''),
              //       //   width: 200,
              //       //   height: 300,
              //       //   fit: BoxFit.cover,
              //       // ),
              //     ],
              //   ),
            ],
          )
        ]),
      )),
      //bottomNavigationBar: BottomBar(),
    );
  }
}
