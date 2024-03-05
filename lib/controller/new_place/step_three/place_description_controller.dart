import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/controller/new_place/create_listing_contoller.dart';

class PlaceDescriptionController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  CreateListingController createListingController = Get.find();

  void onChangedtitle(String value) =>
      createListingController.title.value = value;

  void onChangedDescription(String value) =>
      createListingController.decoration.value = value;
}
