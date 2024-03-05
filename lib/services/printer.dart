import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Printer {
  // To print the error to the console
  static void printError(dynamic error) {
    log('Error: $error');
  }

  // To print a warning on the console
  static void print(dynamic warning) {
    log('$warning');
  }

  // دالة لعرض رسالة الخطأ في Snackbar
  static void showSnackbarError(
      {required String title, required String message, bool isTop = true}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.grey.withOpacity(0.6),
      snackPosition: isTop ? SnackPosition.top : SnackPosition.bottom,
    );
  }
}
