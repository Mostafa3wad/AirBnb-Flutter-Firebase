import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/controller/new_place/create_listing_contoller.dart';
import 'package:project_one/services/printer.dart';

class SetPriceController extends GetxController {
  TextEditingController priceController = TextEditingController(text: '50');

  CreateListingController createListingController = Get.find();

  void onChanged(String value) {
    try {
      if (value.isNotEmpty) {
        createListingController.price.value = int.parse(value);
      }
    } catch (e) {
      Printer.print(e);
    }
    update();
  }
}
