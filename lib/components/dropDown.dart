import 'package:flutter/material.dart';

import '../global/globalColors.dart';
import '../global/globalShadow.dart';

class DropDown {
  static Widget buildDropdownContainer(
      BuildContext context,
      String label,
      List<String> options,
      String? selectedValue,
      ValueChanged<String?> onChanged,
      ) {
    return Container(
      width: 339,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: [CustomBoxShadow()],
      ),
      child: DropdownButtonFormField(
        value: selectedValue,
        items: options.map((option) {
          return DropdownMenuItem(
            value: option,
            child: Text(
              option,
              style: TextStyle(
                fontFamily: 'Montserrat',
                  color: Colors.black54
              ),
            ),
          );
        }).toList(),
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          labelText: label, // Set the label text
          labelStyle: TextStyle(
            fontFamily: 'Montserrat', color: Colors.black45, // Set your desired font family for the label
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class ProfileDropDown {
  static Widget buildDropdownContainer(
      BuildContext context,
      String label,
      List<String> options,
      String? selectedValue,
      ValueChanged<String?> onChanged,
      ) {
    return Container(
      width: 339,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: GlobalColors.boxColor,
        boxShadow: [CustomBoxShadow()],
      ),
      child: DropdownButtonFormField(
        value: selectedValue,
        style: TextStyle(
          fontFamily: 'Montserrat',),
        items: options.map((option) {
          return DropdownMenuItem(
            value: option,
            child: Text(
              option,
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.black54
              ),
            ),
          );
        }).toList(),
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          labelText: label, // Set the label text
          labelStyle: TextStyle(
            fontFamily: 'Montserrat', color: Colors.black45, // Set your desired font family for the label
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

