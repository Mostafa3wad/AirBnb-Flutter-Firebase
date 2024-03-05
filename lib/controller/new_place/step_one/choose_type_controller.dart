import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/controller/new_place/create_listing_contoller.dart';

class ChooseTypeController extends GetxController {
  final CreateListingController createListingController = Get.find();

  int? itemSelectCount;

  List<List> typesOfPlaces = [
    ['House', Icons.house_outlined],
    ['Apartment', Icons.apartment_outlined],
    ['Hotel', Icons.local_hotel_outlined],
    ['Villa', Icons.villa],
    ['Chalet', Icons.chalet],
    ['Yacht', Icons.abc_rounded],
    ['Boat', Icons.abc_rounded],
  ];

  void choosePLase(int index) {
    itemSelectCount = index;
    createListingController.placeType.value = typesOfPlaces[index][0];
    update();
  }
}
