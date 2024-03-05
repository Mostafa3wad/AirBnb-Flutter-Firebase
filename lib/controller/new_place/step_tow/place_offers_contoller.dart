import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project_one/controller/new_place/create_listing_contoller.dart';

class PlaceOffersController extends GetxController {
  final CreateListingController createListingController = Get.find();

  bool isCompleted = false;
  List<String> itemSelectCount = [];

  List<List> typesOfPlaces = [
    ['Wifi', Icons.wifi],
    ['TV', Icons.tv_rounded],
    ['Kitchen', Icons.kitchen_sharp],
    ['Free parking on permises', LineIcons.car],
    ['Paid parking on premises', LineIcons.parking],
    ['Pool', Icons.pool_outlined],
    ['Dedicated workspace', Icons.weekend_outlined],
    ['Hot tub', Icons.hot_tub],
    ['Piano', Icons.piano],
    ['Beach access', Icons.beach_access],
    ['Exercise equipment', Icons.abc],
    ['Air conditioning', Icons.abc],
    ['Patio', Icons.abc],
  ];

  void choosePLase(int index) {
    if (itemSelectCount.contains(typesOfPlaces[index][0])) {
      itemSelectCount
          .removeAt(itemSelectCount.indexOf(typesOfPlaces[index][0]));
    } else {
      itemSelectCount.add(typesOfPlaces[index][0]);
    }
    if (itemSelectCount.isNotEmpty) isCompleted = true;
    if (itemSelectCount.isEmpty) isCompleted = false;
    createListingController.placeOffers.value = itemSelectCount;
    update();
  }
}
