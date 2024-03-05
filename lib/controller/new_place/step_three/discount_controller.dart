import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/controller/new_place/create_listing_contoller.dart';
import 'package:project_one/services/printer.dart';

class DiscountController extends GetxController {
  CreateListingController _createListingViewModel = Get.find();
  RxBool isPrimary = true.obs, isWeekly = true.obs, isMonthly = true.obs;

  Rx<TextEditingController> weeklyController =
      TextEditingController(text: '10').obs;
  Rx<TextEditingController> monthlyController =
      TextEditingController(text: '10').obs;

  void primarycheskBox(bool? value) {
    isPrimary.value = value!;
    Printer.print(value);
    if (isPrimary.value) {
      _createListingViewModel.primaryDiscount.value = 20;
    } else {
      _createListingViewModel.primaryDiscount.value = 0;
    }
  }

  void weeklycheskBox(bool? value) {
    isWeekly.value = value!;
    if (isWeekly.value) {
      _createListingViewModel.weeklyDiscount.value =
          int.parse(weeklyController.value.text);
    } else {
      _createListingViewModel.weeklyDiscount.value = 0;
    }
  }

  void monthlycheskBox(bool? value) {
    isMonthly.value = value!;
    if (isMonthly.value) {
      _createListingViewModel.monthlyDiscount.value =
          int.parse(monthlyController.value.text);
    } else {
      _createListingViewModel.monthlyDiscount.value = 0;
    }
  }
}
