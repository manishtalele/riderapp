import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker {
  getDate({required BuildContext context, required Function setDate}) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2100));

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      //formatted date output using intl package =>  2022-11-10
      setDate(formattedDate);
    } else {
      setDate(null);
    }
  }
}
