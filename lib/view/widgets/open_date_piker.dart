import 'package:flutter/material.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';

void openDatePicker(BuildContext context,
    {required Function(dynamic)? onSubmit}) {
  BottomPicker.date(
    title: 'Set your Birthday',
    dateOrder: DatePickerDateOrder.dmy,
    initialDateTime: DateTime(2005, 11, 10),
    maxDateTime: DateTime.now().subtract(const Duration(days: 18 * 365)),
    pickerTextStyle: const TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.bold,
      fontSize: 12,
    ),
    titleStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: Colors.blue,
    ),
    onSubmit: onSubmit,
    bottomPickerTheme: BottomPickerTheme.plumPlate,
  ).show(context);
}
