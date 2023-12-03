import 'package:flutter/material.dart';
import '../global/globalColors.dart';
import '../global/globalShadow.dart';
import '../services/auth_services.dart';

class FeedbackForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 45, right: 0),
        child: Column(
          children: [
            Container(
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
                  decoration: const InputDecoration(
                    hintText: 'Enter Feedback Title',
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
              height: 200,
              width: 339,
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                color: GlobalColors.boxColor,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [CustomBoxShadow()],
              ),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Enter Feedbacks here',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            Container(
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

          ],
        ),
      ),
    );
  }
}
