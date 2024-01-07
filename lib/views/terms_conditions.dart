import 'package:easy_rental_nepal/global/globalColors.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions', style: TextStyle(color: Colors.white),),
        backgroundColor: GlobalColors.fontColor,
        iconTheme: IconThemeData(color: Colors.white)
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to Our Car Rental App!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              buildSection(
                title: '1. Acceptance of Terms',
                content: 'By using our app, you agree to comply with and be bound by these terms and conditions.',
              ),
              buildSection(
                title: '2. Rental Agreement',
                content: 'Before renting a car, please read and understand our rental agreement. It contains important information about fees, insurance, and other terms of service.',
              ),
              buildSection(
                title: '3. Payment and Fees',
                content: 'Payment is required upfront. Additional fees may apply for late returns or damages to the rental vehicle.',
              ),
              buildSection(
                title: '4. Insurance Coverage',
                content: 'Our rental includes basic insurance coverage. Additional insurance options are available for purchase.',
              ),
              buildSection(
                title: '5. Vehicle Pickup and Return',
                content: 'Please pick up and return the rental vehicle at the agreed-upon location and time. Late returns may incur extra charges.',
              ),
              buildSection(
                title: '6. Cancellation Policy',
                content: 'Cancellations must be made at least 24 hours in advance to receive a full refund. Late cancellations may result in a fee.',
              ),
              buildSection(
                title: '7. User Responsibilities',
                content: 'Users are responsible for the proper use and care of the rental vehicle. Any violations or misuse may result in penalties.',
              ),
              buildSection(
                title: '8. Privacy Policy',
                content: 'We respect your privacy. Our privacy policy outlines how we collect, use, and safeguard your personal information.',
              ),
              buildSection(
                title: '9. Contact Us',
                content: 'If you have any questions about these terms, please contact us at support@example.com.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSection({required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          content,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TermsAndConditionsScreen(),
  ));
}
