import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_rental_nepal/components/dialogBox.dart';
import 'package:easy_rental_nepal/views/success.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../global/globalColors.dart';
import '../global/globalShadow.dart';
import '../modules/car_feature.dart';


class CarDetailsPage extends StatefulWidget {
  final QueryDocumentSnapshot<Object?> carData;

  const
  CarDetailsPage({Key? key, required this.carData}) : super(key: key);

  @override
  _CarDetailsPageState createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage> {
  int? value = 0;
  int totalDays = 0;
  double totalAmount = 0.0;
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;

  final paymentLabels = ['Cash on Delivery', 'Debit/Credit Card', 'e-Wallet'];
  final paymentIcons = [Icons.money_off, Icons.credit_card, Icons.wallet];

  void _submitDataToFirestore() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String selectedPayment = paymentLabels[value ?? 0];
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    String carId = widget.carData.id;
    String? bookerId = auth.currentUser?.uid;

    DocumentSnapshot carDocument =
    await firestore.collection('rent-details').doc(carId).get();

    if (carDocument.exists) {
      // Calculate the total amount based on amount per hour and total days
      double amount= double.parse(widget.carData.get('amount'));
      double totalAmount = (amount * totalDays)*1.10;

      await firestore.collection('rent-details').doc(carId).update({
        'selected_payment': selectedPayment,
        'status': 'booked',
        'bookerId': bookerId,
        'total_amount': totalAmount.toStringAsFixed(2),
        'totalDays': totalDays,
        'rentPeriod': _formatDate(selectedStartDate!) + ' - ' + _formatDate(selectedEndDate!)
      });

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OrderSuccessScreen()),
      );
    } else {
      print('Car document with ID $carId does not exist.');
    }
  }


  String _formatDate(DateTime date) {
    final dateFormat = DateFormat('E, dd MMM', 'en_US');
    return dateFormat.format(date);
  }

  @override
  Widget build(BuildContext context) {
    String imageUrl = widget.carData.get('img');
    String carmodel = widget.carData.get('model');
    String seatings = widget.carData.get('seatings');
    String vehicletype = widget.carData.get('vehicleType');
    String amount = widget.carData.get('amount');
    return Scaffold(
        appBar: AppBar(
          title: Text("Confirm Booking", style: TextStyle(fontFamily: 'Montserrat',color: Colors.white),),
          backgroundColor: GlobalColors.fontColor,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                width: 350,
                height: 200,
                child: Container(
                  decoration: BoxDecoration(
                    color: GlobalColors.boxColor,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [CustomBoxShadow()],
                  ),
                  height: 200,
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 110,
                        width: 180,
                        child: FittedBox(
                          child: Image.network(imageUrl),
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 200,
                        width: 140,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              carmodel,
                              style: TextStyle(fontFamily: 'Montserrat',fontSize: 22),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Seatings: $seatings",
                                      style: TextStyle(
                                          fontSize: 14, color: GlobalColors.fontColor),
                                    ),
                                    Icon(Icons.person, size: 18,),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.check, color: Colors.green),
                                    SizedBox(width: 8.0),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 2),
                                      child: Column(
                                        children: [
                                          Text(
                                            vehicletype,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                                carFeatureItem("Air Conditioning"),
                                carFeatureItem("Meet and PickUp"),
                                const SizedBox(height: 10,),
                                Text("Rs:$amount /per day",style: TextStyle(
                                    fontSize: 16),)

                              ],

                            ),
                          ],
                        ),
                      ),
                    ],

                  ),
                ),
              ),
            ),
            Container(
              height: 85,
              width: 350,
              decoration: BoxDecoration(
                color: GlobalColors.boxColor,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [CustomBoxShadow()],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 40, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // Align text to the left
                  children: [
                    Text("Amount          :   Rs: $amount/day", style: TextStyle(fontSize: 22)),
                    const SizedBox(height: 10),
                    Text("Tax                  :   10% ", style: TextStyle(fontSize: 22)),

                  ],
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
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        selectedStartDate != null && selectedEndDate != null
                            ? '${_formatDate(selectedStartDate!)} - ${_formatDate(selectedEndDate!)}'
                            : 'Select Start and End Date', style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final DateTimeRange? dateTimeRange = await showDateRangePicker(
                          context: context, firstDate: DateTime(2000), lastDate:DateTime(3000));
                      if (dateTimeRange != null) {
                        setState(() {
                          selectedStartDate = dateTimeRange.start;
                          selectedEndDate = dateTimeRange.end;

                          totalDays = selectedEndDate!.difference(selectedStartDate!).inDays;
                          print('Total Days: $totalDays');
                        });
                      }
                      setState(() {
                        totalAmount = ((double.parse(amount) * totalDays)* 1.10);
                      });
                    },

                    child: Icon(Icons.date_range_outlined),
                  ),
                ],
              ),
            ),
            Container(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: paymentLabels.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Radio(
                      value: index,
                      groupValue: value,
                      onChanged: (int? i) {
                        setState(() {
                          value = i;
                        });
                      },
                    ),
                    title: Text(
                      paymentLabels[index],
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: Icon(paymentIcons[index], color: Colors.black),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 1.5,
                  );
                },
              ),
            ),
            Container(
              color: GlobalColors.boxColor,
                height: 110.0, // Adjust the height as needed
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child:Column(
                  children: [
                    const SizedBox(height: 10,),
                    Text("Total Amount: Rs ${totalAmount.toStringAsFixed(2)} ", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),),
                    const SizedBox(height: 10,),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      GestureDetector(
                        onTap: () {
                          if (value != null) {
                            if (selectedStartDate != null && selectedEndDate != null) {
                              _submitDataToFirestore();
                            } else {
                              Dialogbox.warningDialogueBox(context,"Confirmation Failed", "Please select start and end dates.");
                            }
                          } else {
                            Dialogbox.warningDialogueBox(context, "Confirmation Failed", "Please select a payment method.");
                          }
                        },
                        child: Container(
                          height: 45,
                          width: 246,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 75, 181, 67),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [CustomBoxShadow()],
                          ),
                          child: const Center(
                            child: Text(
                              "Confirm",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ],
                )
            )
          ],
        ),);
  }
}
