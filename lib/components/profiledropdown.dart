import 'package:easy_rental_nepal/global/globalColors.dart';
import 'package:flutter/material.dart';

import '../global/globalShadow.dart';

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
        items: options.map((option) {
          return DropdownMenuItem(
            value: option,
            child: Text(option),
          );
        }).toList(),
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 25), // Adjust padding
          hintText: selectedValue != null ? selectedValue : label,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
