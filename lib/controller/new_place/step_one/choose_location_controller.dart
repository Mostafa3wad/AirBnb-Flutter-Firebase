import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_one/controller/new_place/create_listing_contoller.dart';
import 'package:project_one/models/location.dart';
import 'package:project_one/services/printer.dart';

class ChooseLocationController extends GetxController {
  CreateListingController createListingController = Get.find();

  GoogleMapController? googleMapcontroller;

  Rx<TextEditingController> countryController = TextEditingController().obs;
  Rx<TextEditingController> cityController = TextEditingController().obs;
  Rx<TextEditingController> streetController = TextEditingController().obs;
  Position? position;
  String fullStreet = '';
  List<Marker> marker = <Marker>[];
  Rx<CameraPosition> kGooglePlex =
      const CameraPosition(target: LatLng(31.0, 32.0), zoom: 10).obs;

  @override
  void onInit() async {
    super.onInit();
    await _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      // Test if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        Printer.printError('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Printer.printError('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.whileInUse) {
        position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);

        googleMapcontroller!.animateCamera(CameraUpdate.newLatLng(
            LatLng(position!.latitude, position!.longitude)));
        addLoctaion(LatLng(position!.latitude, position!.longitude));

        fullStreet =
            '${countryController.value.text} ${cityController.value.text} ${streetController.value.text}';
        update();
      }
    } catch (e) {
      Printer.printError('$e');
    }
  }

  void getAddress() {
    fullStreet =
        '${countryController.value.text} ${cityController.value.text} ${streetController.value.text}';
    update();
    Get.back();
  }

  void addLoctaion(LatLng latLng) async {
    try {
      marker.clear();
      marker.add(Marker(
          markerId: const MarkerId('1'),
          position: LatLng(latLng.latitude, latLng.longitude)));
      createListingController = Get.find();
      createListingController.locationModel =
          LocationModel(latitude: latLng.latitude, longitude: latLng.longitude);
      List<Placemark> placeMark =
          await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
      fullStreet =
          '${placeMark[0].country} ${placeMark[0].locality} ${placeMark[0].street}';

      countryController.value.text = placeMark[0].country!;
      cityController.value.text = placeMark[0].locality!;
      streetController.value.text = placeMark[0].street!;
      update();
    } catch (e) {
      Printer.print(e.toString());
    }
  }
}
